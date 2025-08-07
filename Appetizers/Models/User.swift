//
//  User.swift
//  Appetizers
//
//  Created by lbr on 07/08/25.
//

import Foundation

struct User: Codable {
    var firstName           = ""
    var lastName            = ""
    var email               = ""
    var birthday            = Date()
    var isLactoseIntolerant = false
    var isCiliac            = false
    var isDiabetic          = false
}
