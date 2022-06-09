//
//  FeedViewModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 23.05.2022.
//

import Foundation

@MainActor class FeedViewModel: ObservableObject {
    
    let feedService = FeedService(with: NetworkServiceImp())
    @Published var availableJobs: [JobListModel] = []
    @Published var availableWorkers: [WorkerListModel] = []
    
    func loadAvailableJobs()  {
        feedService.getJobs { result in
            switch result {
        case .success(let response):
                DispatchQueue.main.async {
                    self.availableJobs = response
                }
        case .failure(let error):
            print(error)
            }
        }
    }
    
    func loadAvailableWorkers() {
        feedService.getWorkers { result in
            switch result {
        case .success(let response):
                print(response)
                DispatchQueue.main.async {
                    self.availableWorkers = response
                }
        case .failure(let error):
            print(error)
            }
        }
    }
}
