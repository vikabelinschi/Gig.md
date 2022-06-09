//
//  NotificationsService.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 06.06.2022.
//

import Foundation



class NotificationsService {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    // MARK: - Constants and Variables
    
    private enum ApiConstants {
        static let url = "http://gigmd2-env.eba-ajmjrmc5.us-east-1.elasticbeanstalk.com/api"
        static let pathForAllUsersOffers = "/jobs/my_listings"
    }
    
    let networkService: NetworkService
    
    // MARK: - Initializers
    
    required init(with networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - FeedServiceMethods

    func getAllUsersJobs(completion: @escaping(Result <Data, Error>) -> Void) {
        networkService.get(url: ApiConstants.url,
                           path: ApiConstants.pathForAllUsersOffers,
                           body: nil,
                           httpHeaders: ["authorization": CommonVars.token],
                           queryItems: nil) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getOfferDetails(jobId: String, completion: @escaping(Result <Data, Error>) -> Void) {
        networkService.get(url: ApiConstants.url,
                           path: "/jobs/\(jobId)",
                           body: nil,
                           httpHeaders: ["authorization": CommonVars.token],
                           queryItems: nil, completion: completion)
    }
    
    func getEmploymentId(jobId: String, completion: @escaping(Result <Data, Error>) -> Void) {
        networkService.get(url: ApiConstants.url,
                           path: "/jobs/\(jobId)/getEmployment",
                           body: nil,
                           httpHeaders: ["authorization": CommonVars.token],
                           queryItems: nil, completion: completion)
    }
    
    func getEmployerDetails(userId: String, completion: @escaping(Result <Data, Error>) -> Void) {
        networkService.get(url: ApiConstants.url,
                           path: "users/\(userId)/contact",
                           body: nil,
                           httpHeaders: ["authorization": CommonVars.token],
                           queryItems: nil, completion: completion)
    }
    
    
    func acceptEmployer(jobId: String, completion: @escaping(Result <Data, Error>) -> Void) {
        networkService.put(url: ApiConstants.url,
                           path: "/jobs/\(jobId)/accept",
                           body: nil,
                           httpHeaders: ["authorization": CommonVars.token],
                           completion: completion)
    }
    
    func rejectEmployer(jobId: String, completion: @escaping(Result <Data, Error>) -> Void) {
        networkService.put(url: ApiConstants.url,
                           path: "/jobs/\(jobId)/reject",
                           body: nil,
                           httpHeaders: ["authorization": CommonVars.token],
                           completion: completion)
    }
    
    func deleteJob(jobId: String, completion: @escaping(Result <Data, Error>) -> Void) {
        networkService.delete(url: ApiConstants.url,
                              path: "/jobs/\(jobId)",
                              body: nil,
                              httpHeaders: ["authorization": CommonVars.token],
                              completion: completion)
    }
}
