//
//  EmployerAcceptDetailsModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 06.06.2022.
//

import Foundation

struct  EmployerAcceptDetailsModel: Codable, Hashable {
    
    var id: String
    var userName: String
    var skills: [String]
    var age: String
    var description: String
    var educationDetails: [String]
    var experiences: [String]
    var phoneNumber: String
    var jobId: Int
}
