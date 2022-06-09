//
//  NotificationsViewModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 06.06.2022.
//

import Foundation
import SwiftUI
import simd

public class NotificationsViewModel: ObservableObject {
    
    let decoder = JSONDecoder()
    @Published var listOfJobs: [JobOfferDetailsModel] = []
    @Published var employer: EmployerAcceptDetailsModel?
    var service = NotificationsService(with: NetworkServiceImp())
    @Published var showEmployerDetails: Bool = false
    @Published var hideEmployerDetails: Bool = false
    private var employerInfo: WorkerDetailModel?
    
    
    
    
    // MARK: - BookedJobsMethods
    
    
    func getBookedJobsListDetails()  {
        getAllJobs()
    }
    
    func getAllJobs() {
        var usersJobs: [UsersJobsModel] = []
        service.getAllUsersJobs() { result in
            switch result {
            case .success(let data):
                if let decodedData = try? self.decoder.decode([UsersJobsModel].self, from: data) {
                    usersJobs = decodedData
                    self.getJobsIds(jobs: usersJobs)
                    print("usersJobs")
                    print(usersJobs)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getJobsIds(jobs: [UsersJobsModel]) {
        var ids: [Int] = []
        for job in jobs {
            ids.append(job.id)
        }
        getBookedJobs(ids: ids)
    }
    
    func getBookedJobs(ids: [Int])  {
        var bookedJobs: [JobOfferDetailsModel] = []
        for id in ids {
            service.getOfferDetails(jobId: String(id)) { result in
                switch result {
                case .success(let data):
                    if let decodedData = try? self.decoder.decode(JobOfferDetailsModel.self, from: data) {
                        if decodedData.booked {
                            bookedJobs.append(decodedData)
                        }
                    }
                case .failure(let error):
                    print(error)
                }
                DispatchQueue.main.async {
                    self.listOfJobs = bookedJobs
                }
            }
        }
    }
    
    // MARK: - EmployerDetailsMethods
    
    func getEmployerId(jobId: Int, completion: @escaping (Result<WorkerDetailModel,Error>)-> Void) {
        service.getEmploymentId(jobId: String(jobId)) { result in
            switch result {
            case .success(let data):
                if let decodedData  = String(data: data, encoding: String.Encoding.utf8) as String? {
                    print(decodedData)
                    self.getEmployerInfo(userId: decodedData) { result in
                        switch result{
                        case .success(let data):
                            completion(.success(data))
                        case .failure(let error):
                            completion(.failure(error))
                        }
                        
                    }
                }
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
    
    private func getEmployerInfo(userId: String, completion: @escaping (Result <WorkerDetailModel, Error>)-> Void) {
        service.getEmployerDetails(userId: userId) { result in
            switch result {
            case .success(let data):
                if let decodedData = try? self.decoder.decode(WorkerDetailModel.self, from: data) {
                    completion(.success(decodedData))
                }
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
    
    func getEmployerInfoFromJobId(jobId: Int)  {
        getEmployerId(jobId: jobId) { result in
            switch result {
            case .success(let data):
                self.employerInfo = data
                if let employerInfo = self.employerInfo {
                    DispatchQueue.main.async {
                        self.showEmployerDetails = true
                        self.employer = EmployerAcceptDetailsModel(id: String(employerInfo.id), userName: employerInfo.userName, skills: employerInfo.skills, age: employerInfo.age, description: employerInfo.description, educationDetails: employerInfo.educationDetails, experiences: employerInfo.experiences, phoneNumber: employerInfo.phoneNumber, jobId: jobId)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func acceptEmployee(jobId: Int) {
        service.acceptEmployer(jobId: String(jobId)) { result in
            switch result {
            case .success:
                print("success")
                self.deleteJobOffer(jobId: jobId)
                self.showEmployerDetails = false
                let index = self.listOfJobs.firstIndex { $0.id == jobId}
                if let index = index {
                    self.listOfJobs.remove(at: index)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func deleteJobOffer(jobId: Int) {
        service.deleteJob(jobId: String(jobId)) { result in
            switch result {
            case .success:
                print("success")
                DispatchQueue.main.async {
                    self.showEmployerDetails = false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func rejectEmployee(jobId: Int) {
        service.rejectEmployer(jobId: String(jobId)) { result in
            switch result {
            case .success:
                print("success")
                DispatchQueue.main.async {
                    self.showEmployerDetails = false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
