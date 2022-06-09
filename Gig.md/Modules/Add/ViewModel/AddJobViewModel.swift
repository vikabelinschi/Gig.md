//
//  AddJobViewModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 06.06.2022.
//

import Foundation
import SwiftUI

class AddJobViewModel: ObservableObject {
    
    @Published var showAddJob: Bool = true
    let networkService = AddService(with: NetworkServiceImp())
    let dateFormatter = DateFormatter()
    
    func addJob( jobName: String, description: String, category: String, location: String, date: Date, wage: String) {
        let model = AddJobModel(jobName: jobName, description: description, category: category, location: location, date: convertDate(date: date), wage: wage)
        self.networkService.postJob(addJobModel: model) { result in
                switch result {
            case .success:
                    DispatchQueue.main.async {
                        self.showAddJob = false
                        print("Success")
                    }
            case .failure:
                    print("Error")
                }
        }
    }
    
    func convertDate(date: Date) -> String {
        dateFormatter.dateFormat = "dd-MM-YYYY"
        return dateFormatter.string(from: date)
    }
}
