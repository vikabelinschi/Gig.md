//
//  JobDetailViewModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 30.05.2022.
//

import Foundation
import SwiftUI

@MainActor class JobDetailViewModel: ObservableObject {
    
    @Published var detailedJob: JobDetailModel?
    @Published var showingAlert: Bool = false 
    var service = DetailPageService(with: NetworkServiceImp())
    
    func getJobDetail(jobId: Int)  {
        service.getJobDetail(JobId: jobId) { result in
            switch result {
            case .success(let response):
                print("ok")
                DispatchQueue.main.async {
                self.detailedJob = response
                }
            case .failure(let error):
                print("not ok")
                print(error)
            }
        }
    }
    
    func applyToJob(jobId:Int) {
        service.applyToJob(JobId: jobId) { result in
            switch result {
            case .success(let response):
                print(response)
                self.showingAlert = true
            case .failure(let error):
                print(error)
            }
        }
    }
}
