//
//  HttpClient.swift
//
//  Created by Diogo Autilio on 15/08/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

final class HttpClient: HttpClientProtocol {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension HttpClient {

    typealias DecodingCompletionHandler = (Decodable?, APIError?) -> Void

    var logger: NetworkingLogger {
        return NetworkingLogger(level: .debug)
    }

    private func decodingTask<T: Decodable>(with request: URLRequest,
                                            decodingType: T.Type,
                                            completionHandler completion: @escaping (T?, RequestError?) -> Void) -> URLSessionDataTask
    {
        let requestDate = Date()
        let task = session.dataTask(with: request) { [weak self] data, response, error in

            let responseTime = Date().timeIntervalSince(requestDate)

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, self?.failureReason(HttpStatusCode.unknown, error))
                return
            }
            let statusCode = HttpStatusCode(fromRawValue: httpResponse.statusCode)
            switch statusCode {
            case .ok ... .permanentRedirect:
                if let data = data {
                    do {
                        self?.logger.log(response: response, data: data, time: responseTime)
                        let model = try JSONDecoder().decode(decodingType, from: data)
                        completion(model, nil)
                    } catch let DecodingError.keyNotFound(key, context) {
                        completion(nil, RequestError(statusCode, reason: .keyNotFound(key: key, context: context.debugDescription)))
                    } catch let DecodingError.valueNotFound(type, context) {
                        completion(nil, RequestError(statusCode, reason: .valueNotFound(type: type, context: context.debugDescription)))
                    } catch let DecodingError.typeMismatch(type, context) {
                        completion(nil, RequestError(statusCode, reason: .typeMismatch(type: type, context: context.debugDescription)))
                    } catch let DecodingError.dataCorrupted(context) {
                        completion(nil, RequestError(statusCode, reason: .dataCorrupted(context: context.debugDescription)))
                    } catch let error as NSError {
                        completion(nil, RequestError(statusCode, reason: .jsonConversionFailure(domain: error.domain, description: error.localizedDescription)))
                    }
                } else {
                    completion(nil, RequestError(statusCode, reason: .invalidData))
                }
            default:
                completion(nil, RequestError(statusCode, reason: .responseUnsuccessful))
            }
        }
        return task
    }

    func request<T: Decodable>(_ request: URLRequest, decode: ((T) -> T)?, completion: @escaping (Result<T, APIError>) -> Void) {
        logger.log(request: request)

        let task = decodingTask(with: request, decodingType: T.self) { [weak self] json, error in

            DispatchQueue.main.async {
                if let error = error {
                    self?.logger.logError(request: request, statusCode: error.statusCode.rawValue, error: error.reason)
                    completion(.failure(error.reason))
                    return
                }
                if let json = json {
                    if let value = decode?(json) {
                        completion(.success(value))
                    } else {
                        completion(.success(json))
                    }
                }
            }
        }
        task.resume()
    }

    func cancelAllRequests() {
        session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
            dataTasks.forEach { $0.cancel() }
            uploadTasks.forEach { $0.cancel() }
            downloadTasks.forEach { $0.cancel() }
        }
    }

    // MARK: - Helper

    private func failureReason(_ statusCode: HttpStatusCode, _ error: Error?) -> RequestError {
        var reason: APIError = .requestFailed(reason: error?.localizedDescription)

        if let error = error as NSError?, error.code == NSURLErrorCancelled {
            reason = .requestCancelled
        }
        return RequestError(statusCode, reason: reason)
    }
}
