//
//  User.swift
//  Appetizers
//
//  Created by lbr on 07/08/25.
//

import Foundation

struct User: Equatable, Codable {
    var firstName           = ""
    var lastName            = ""
    var email               = ""
    var birthday            = Date()
    var isLactoseIntolerant = false
    var isCeliac            = false
    var isDiabetic          = false
    
    init(firstName: String = "", lastName: String = "", email: String = "", birthday: Date = Date(), isLactoseIntolerant: Bool = false, isCeliac: Bool = false, isDiabetic: Bool = false) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.birthday = birthday
        self.isLactoseIntolerant = isLactoseIntolerant
        self.isCeliac = isCeliac
        self.isDiabetic = isDiabetic
    }
}
