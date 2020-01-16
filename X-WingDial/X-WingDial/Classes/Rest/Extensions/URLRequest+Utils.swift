//
//  URLRequest+Utils.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 16/01/20.
//  Copyright © 2020 Diogo Autilio. All rights reserved.
//

import Foundation

extension URLRequest {

     init(with url: URL?) {
        guard let url = url else {
            preconditionFailure("Invalid URL")
        }
        self = URLRequest(url: url)
    }
}
