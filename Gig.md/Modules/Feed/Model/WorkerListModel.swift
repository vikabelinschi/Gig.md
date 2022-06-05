//
//  WorkerListModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 29.05.2022.
//

import Foundation

struct WorkerListModel: Codable, Hashable {

    var id: Int
    var userName: String
    var skills: [String]
}
