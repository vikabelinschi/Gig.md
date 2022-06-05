//
//  JobListModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 29.05.2022.
//

import Foundation

struct JobListModel: Codable, Hashable {
    var id: Int
    var jobName: String
    var wage: Int
    var userName: String
    
}
