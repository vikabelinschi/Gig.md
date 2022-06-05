//
//  AddWorkerViewModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 05.06.2022.
//

import Foundation
import SwiftUI

class AddWorkerViewModel: ObservableObject {
    
    @Published var showAddWorker: Bool = true
    let networkService = AddService(with: NetworkServiceImp())
    
    func addWorker( skills: [String], description: String, educationDetails: [String], experiences: [String]) {
        let model = AddWorkerModel(skills: skills, description: description, educationDetails: educationDetails, experiences: experiences)
            self.networkService.postWorker(addWorkerModel: model) { result in
                switch result {
            case .success:
                    DispatchQueue.main.async {
                        self.showAddWorker = false
                        print("Success")
                    }
            case .failure:
                    print("Error")
                }
        }
    }
}
