//
//  BodyParameters+Utils.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 25/06/22.
//  Copyright © 2022 Diogo Autilio. All rights reserved.
//

import Foundation

extension BodyParameters {

    var dataEncoded: Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: .sortedKeys)
    }
}
