//
//  JobDetailViewModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 30.05.2022.
//

import Foundation

@MainActor class JobDetailViewModel: ObservableObject {
    
    @Published var detailedJob: JobDetailModel?
    var service = DetailPageService(with: NetworkServiceImp())
    
    func getJobDetail(jobId: Int)  {
        service.getJobDetail(JobId: jobId) { result in
            switch result {
            case .success(let response):
                print("ok")
                self.detailedJob = response
            case .failure(let error):
                print("not ok")
                print(error)
            }
        }
    }
}
