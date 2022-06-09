//
//  FeedService.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 23.05.2022.
//

import Foundation

class FeedService {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    // MARK: - Constants and Variables
    
    private enum APIConstants {
        static let url = "http://gigmd2-env.eba-ajmjrmc5.us-east-1.elasticbeanstalk.com/api"
        static let jobsPath = "/jobs/available"
        static let workersPath = "/users"
    }
    
    let networkService: NetworkService
    
    // MARK: - Initializers
    
    required init(with networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - NotificationsServiceMethods
    
    func getJobs(completion: @escaping(Result <[JobListModel], Error>) -> Void) {
        do {
            DispatchQueue.main.async {
                self.networkService.get(url: APIConstants.url,
                                    path: APIConstants.jobsPath,
                                    body: nil,
                                   httpHeaders: ["authorization": CommonVars.token],
                                   queryItems: nil) { result in
                    switch result {
                    case .success(let data):
                        if let decodedData = try? self.decoder.decode([JobListModel].self, from: data) {
                            completion(.success(decodedData))
                        }
                    case .failure(let error):
                        print(error)
                        completion(.failure(error))
                    }
                }
            }
        }
    }
    
    func getWorkers(completion: @escaping(Result <[WorkerListModel], Error>) -> Void) {
        do {
            DispatchQueue.main.async {
                self.networkService.get(url: APIConstants.url,
                                    path: APIConstants.workersPath,
                                    body: nil,
                                   httpHeaders: ["authorization": CommonVars.token],
                                   queryItems: nil) { result in
                    switch result {
                    case .success(let data):
                        if let decodedData = try? self.decoder.decode([WorkerListModel].self, from: data) {
                            completion(.success(decodedData))
                            print("decoodedData")
                            print("success")
                        }
                    case .failure(let error):
                        print(error)
                        completion(.failure(error))
                    }
                }
            }
           
        }
    }
}
