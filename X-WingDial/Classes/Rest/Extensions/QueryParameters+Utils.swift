//
//  QueryParameters+Utils.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 25/06/22.
//  Copyright © 2022 Diogo Autilio. All rights reserved.
//

import Foundation

extension QueryParameters {

    var items: [URLQueryItem] {
        return compactMap { URLQueryItem(name: $0, value: $1) }
    }
}
