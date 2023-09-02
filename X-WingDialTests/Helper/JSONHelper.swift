//
//  JSONHelper.swift
//  X-WingDialTests
//
//  Created by Diogo Autilio on 02/09/23.
//  Copyright © 2023 Diogo Autilio. All rights reserved.
//

import Foundation

private class BundleTestClass {}

enum JSONHelper {

    static func loadJSON<Element: Decodable>(withFile fileName: String) -> Element? {
        var jsonData: Element?
        if let url = Bundle(for: BundleTestClass.self).url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                jsonData = try decoder.decode(Element.self, from: data)
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
        return jsonData
    }

    static func loadJSONData(withFile fileName: String) -> Data? {
        var data: Data?
        if let url = Bundle(for: BundleTestClass.self).url(forResource: fileName, withExtension: "json") {
            do {
                data = try Data(contentsOf: url)
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
        return data
    }
}
