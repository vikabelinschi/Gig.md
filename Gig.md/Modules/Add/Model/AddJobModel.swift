//
//  AddJobModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 05.06.2022.
//

import Foundation

struct AddJobModel: Codable {
    var jobName: String
    var description: String
    var category: String
    var location: String
    var date: String
    var wage: String
    
}
