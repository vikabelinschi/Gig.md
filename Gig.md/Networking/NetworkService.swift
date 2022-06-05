//
//  NetworkService.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 22.05.2022.
//

import Foundation

public protocol NetworkService: AnyObject {
    func get(url: String,
             path: String,
             body: Data?,
             httpHeaders: [String: String]?,
             queryItems: [URLQueryItem]?,
             completion: @escaping(Result <Data, Error>) -> Void)
    
    func post(url: String,
              path: String,
              body: Data?,
              httpHeaders: [String: String]?,
              completion: @escaping(Result <Data, Error>) -> Void)
    
    func delete(url: String,
                path: String,
                body: Data?,
                httpHeaders: [String: String]?,
                completion: @escaping(Result <Data, Error>) -> Void)
    
    
    func put(url: String,
                path: String,
                body: Data?,
                httpHeaders: [String: String]?,
                completion: @escaping(Result <Data, Error>) -> Void)
}


//import Foundation
//import Alamofire
//
//struct Login: Encodable {
//    let email: String
//    let password: String
//}
//
//
//class NetworkService {
//    
//    let headers: HTTPHeaders = [
//        "Content-Type": "application/json",
//        "Authorization": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuaW5hQHRlc3QuY29tIiwicm9sZSI6IlVTRVIiLCJpYXQiOjE2NTI0Mzg3ODQsImV4cCI6MTY1MzA0MzU4NH0.G26RNfbMT60KKFQuTUM3aqUS4iPeuspsi44macBxjQ4"
//    ]
//
//    let logins = Login(email: "nina@next.com", password: "12345")
//    
//    
//    func login() {
//        AF.request(URL(string: "http://localhost:8080/api/auth/login")!, method: .post, parameters: logins,encoder: JSONParameterEncoder.default, headers: headers)
//            .responseJSON { response in
//            print(response)
//        }
//    }
//}
