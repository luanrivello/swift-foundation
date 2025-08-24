//
//  TestData.swift
//  AppetizersTests
//
//  Created by lbr on 24/08/25.
//

import Foundation
@testable import Appetizers

struct TestData {
    static func sampleUser() -> User {
        let user = User(
            firstName           : "Ame",
            lastName            : "no Yoru",
            email               : "rainy.night@maid.cafe",
            birthday            : Date.birthday(year: 2001, month: 6, day: 6),
            isLactoseIntolerant : true,
            isCeliac            : false,
            isDiabetic          : false
        )
        return user
    }
}
