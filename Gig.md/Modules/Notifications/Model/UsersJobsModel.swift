//
//  UsersJobsModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 06.06.2022.
//

import Foundation

struct UsersJobsModel: Codable, Hashable {
    
    var id: Int
    var jobName: String
    var wage: Int
    var userName: String

}
