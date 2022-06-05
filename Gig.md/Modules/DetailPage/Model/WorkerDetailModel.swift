//
//  WorkerDetailModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 29.05.2022.
//

import Foundation

struct  WorkerDetailModel: Codable {
    
    var id: Int
    var userName: String
    var skills: [String]
    var age: String
    var description: String
    var educationDetails: [String]
    var experiences: [String]
    var phoneNumber: String
}
