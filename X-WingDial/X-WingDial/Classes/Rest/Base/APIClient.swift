//
//  APIClient.swift
//
//  Created by Diogo Autilio on 15/08/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

protocol APIClient {

    var session: URLSession { get }
    func request<T: Decodable>(_ request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, APIError>) -> Void)
}

extension APIClient {

    typealias DecodingCompletionHandler = (Decodable?, APIError?) -> Void

    func decodingTask<T: Decodable>(with request: URLRequest,
                                    decodingType: T.Type,
                                    completionHandler completion: @escaping DecodingCompletionHandler) -> URLSessionDataTask {

        let task = self.session.dataTask(with: request) { data, response, error in

            guard let httpResponse = response as? HTTPURLResponse else {
                if let error = error as NSError?, error.domain == NSURLErrorDomain && error.code == NSURLErrorCancelled {
                    completion(nil, .requestCancelled)
                } else {
                    completion(nil, .requestFailed(reason: error?.localizedDescription))
                }
                return
            }
            switch httpResponse.statusCode {
            case 200...399:
                if let data = data {
                    do {
                        let model = try JSONDecoder().decode(decodingType, from: data)
                        completion(model, nil)
                    } catch {
                        completion(nil, .jsonConversionFailure)
                    }
                } else {
                    completion(nil, .invalidData)
                }
            default:
                completion(nil, .responseUnsuccessful)
            }
        }
        return task
    }

    func request<T: Decodable>(_ request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, APIError>) -> Void) {

        let task = self.decodingTask(with: request, decodingType: T.self) { json, error in

            DispatchQueue.main.async {
                guard let json = json else {
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.failure(.invalidData))
                    }
                    return
                }
                if let value = decode(json) {
                    completion(.success(value))
                } else {
                    completion(.failure(.jsonParsingFailure))
                }
            }
        }
        task.resume()
    }

    func cancel() {
        self.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
            dataTasks.forEach { $0.cancel() }
            uploadTasks.forEach { $0.cancel() }
            downloadTasks.forEach { $0.cancel() }
        }
    }
}
