//
//  WorkerDetailViewModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 29.05.2022.
//

import Foundation

@MainActor class WorkerDetailViewModel: ObservableObject {
    
    var service = DetailPageService(with: NetworkServiceImp())
    @Published var worker: WorkerDetailModel?
    
    func getDetailedWorker(workerId: Int) {
        print("Here")
        service.getWorkerDetail(workerId: workerId) { result in
            switch result {
            case .success(let response):
                self.worker = response
            case .failure(let error):
                print(error)
            }
        }
    }
}
