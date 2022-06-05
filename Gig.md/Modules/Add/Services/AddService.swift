//
//  AddService.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 05.06.2022.
//

import Foundation

class AddService {
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
    
    // MARK: - ServiceMethods
    
    
    func postWorker(addWorkerModel: AddWorkerModel,
                completion: @escaping(Result <String, Error>) -> Void) {
        do {
            print(addWorkerModel)
            let data = try encoder.encode(addWorkerModel)
            networkService.post(url: APIConstants.url,
                                path: "/users/edit",
                                body: data,
                                httpHeaders: ["Content-Type": "application/json;", "authorization": CommonVars.token]) { result in
                switch result {
                case .success(let data):
                    if let decodedData  = String(data: data, encoding: String.Encoding.utf8) as String? {
                        completion(.success(decodedData))
                    }
                case .failure(let error):
                    print(error)
                    completion(.failure(error))
                }
            }
        } catch {
            completion(.failure(ValidationError.encodingError))
        }
    }
    
    func postJob(addJobModel: AddJobModel,
                completion: @escaping(Result <String, Error>) -> Void) {
        do {
            print(addJobModel)
            let data = try encoder.encode(addWorkerModel)
            networkService.post(url: APIConstants.url,
                                path: "/jobs/add_new",
                                body: data,
                                httpHeaders: ["Content-Type": "application/json;", "authorization": CommonVars.token]) { result in
                switch result {
                case .success(let data):
                    if let decodedData  = String(data: data, encoding: String.Encoding.utf8) as String? {
                        completion(.success(decodedData))
                    }
                case .failure(let error):
                    print(error)
                    completion(.failure(error))
                }
            }
        } catch {
            completion(.failure(ValidationError.encodingError))
        }
    }
}
