//
//  PostedJobsViewModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 07.06.2022.
//

import Foundation
import SwiftUI

public class PostedJobsViewModel: ObservableObject {
    
    let decoder = JSONDecoder()
    @Published var usersJobs: [UsersJobsModel] = []
    var service = NotificationsService(with: NetworkServiceImp())
    
    
    // MARK: - BookedJobsMethods
    
    
    func getAllJobs() {
        service.getAllUsersJobs() { result in
            switch result {
            case .success(let data):
                if let decodedData = try? self.decoder.decode([UsersJobsModel].self, from: data) {
                    self.usersJobs = decodedData
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
