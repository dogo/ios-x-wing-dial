//
//  BaseDelegate.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 17/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

protocol BaseDelegate: AnyObject {
    func didSelectRowAt(_ index: IndexPath)
}
