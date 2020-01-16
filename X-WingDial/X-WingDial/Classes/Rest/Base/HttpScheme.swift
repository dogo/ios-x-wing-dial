//
//  HttpScheme.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 16/01/20.
//  Copyright © 2020 Diogo Autilio. All rights reserved.
//

import Foundation

 /// HTTP scheme definitions.
///
/// See https://en.wikipedia.org/wiki/List_of_URI_schemes
enum HttpScheme: String {
    case http
    case https

     func toString() -> String {
        return self.rawValue
    }
}
