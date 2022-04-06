//
//  JobModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 31.03.2022.
//

import Foundation

struct JobModel: Codable, Hashable {
    var id: String
    var name: String
    var category: String
    var description: String
    var datePosted: String
    var requirements: [String]
    var location: String
    var period: String
    var employer: String
    var price: String
}
