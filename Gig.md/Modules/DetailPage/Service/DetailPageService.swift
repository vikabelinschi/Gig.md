//
//  DetailPageService.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 29.05.2022.
//

import Foundation

class DetailPageService {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    // MARK: - Constants and Variables
    
    private enum APIConstants {
        static let url = "http://localhost:8080/api"
    }
    
    let networkService: NetworkService
    
    // MARK: - Initializers
    
    required init(with networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - FeedServiceMethods
    
    func getWorkerDetail(workerId: Int, completion: @escaping(Result <WorkerDetailModel, Error>) -> Void) {
        DispatchQueue.main.async {
            self.networkService.get(url: APIConstants.url,
                                    path:  "/users/\(workerId)/contact",
                                    body: nil,
                                    httpHeaders: ["authorization": CommonVars.token],
                                    queryItems: nil) { result in
                switch result {
                case .success(let data):
                    if let decodedData = try? self.decoder.decode(WorkerDetailModel.self, from: data) {
                        completion(.success(decodedData))
                        print(decodedData)
                    }
                case .failure(let error):
                    print(error)
                    print("nooo")
                    completion(.failure(error))
                }
            }
        }
    }
    
    func getJobDetail(JobId: Int, completion: @escaping(Result <JobDetailModel, Error>) -> Void) {
        DispatchQueue.main.async {
            self.networkService.get(url: APIConstants.url,
                                    path:  "/jobs/\(JobId)",
                                    body: nil,
                                    httpHeaders: ["authorization": CommonVars.token],
                                    queryItems: nil) { result in
                switch result {
                case .success(let data):
                    print(data)
                    if let decodedData = try? self.decoder.decode(JobDetailModel.self, from: data) {
                        completion(.success(decodedData))
                    }
                case .failure(let error):
                 completion(.failure(error))
                }
            }
        }
    }
}
