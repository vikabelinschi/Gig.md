//
//  WorkerModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 05.04.2022.
//

import Foundation

struct WorkerModel: Codable, Hashable, Identifiable {
    var id: String
    var firstName: String
    var lastName: String
    var email: String
    var phoneNumber: String
    var description: String
    var adress: String //to do create Adress Model?
    var skills: [String] // to do create Skill model
    var certifications: [String?] // to do create certification model
    var education: [String?] // to do create education model
}
