//
//  WorkerModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 05.06.2022.
//

import Foundation

struct AddWorkerModel: Codable {
    var skills: [String]
    var description: String
    var educationDetails: [String]
    var experiences: [String]
}
