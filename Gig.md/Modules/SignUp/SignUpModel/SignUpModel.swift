//
//  SignUpModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 22.05.2022.
//

import Foundation

struct SignUpModel: Codable {
    var email: String
    var password: String
    var name: String
    var surname: String
    var phoneNumber: String
    var age: String
}
