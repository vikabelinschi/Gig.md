//
//  LoginService.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 22.05.2022.
//

import Foundation


class SignUpService {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    // MARK: - Constants and Variables
    
    private enum APIConstants {
        static let url = "http://gigmd2-env.eba-ajmjrmc5.us-east-1.elasticbeanstalk.com/api/"
        static let path = "sign_in"
        static let userNameParameter = "Username"
        static let passwordParameter = "Password"
    }
    
    let networkService: NetworkService
    
    // MARK: - Initializers
    
    required init(with networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - SignInServiceMethods
    
    func signUp(credentials: SignUpModel,
                completion: @escaping(Result <ResponseModel, Error>) -> Void) {
        do {
            print(credentials)
            let data = try encoder.encode(credentials)
            networkService.post(url: APIConstants.url,
                                path: APIConstants.path,
                                body: data,
                                httpHeaders: ["Content-Type": "application/json"]) { result in
                switch result {
                case .success(let data):
                    if let decodedData = try? self.decoder.decode(ResponseModel.self, from: data) {
                        completion(.success(decodedData))
                        print(decodedData)
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
