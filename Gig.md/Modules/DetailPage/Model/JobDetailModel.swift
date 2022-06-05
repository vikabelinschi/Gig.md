//
//  JobDetailModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 30.05.2022.
//

import Foundation

struct JobDetailModel: Codable, Hashable {
    var id: Int
    var jobName: String
    var wage: Int
    var userName: String
    var description: String
    var category: String
    var location: String
    var date: String
    var booked: Bool
}
