//
//  NetworkServiceImp.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 22.05.2022.
//

import Foundation

public class NetworkServiceImp: NSObject, NetworkService {
    
    let session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    private func sendRequest(url: String,
                             path: String,
                             body: Data?,
                             httpMethod: HTTPMethod,
                             httpHeaders: [String: String]?,
                             queryItems: [URLQueryItem]?,
                             completion: @escaping(Result <Data, Error>) -> Void) {

        guard var url = URL(string: url) else {
            completion(.failure(ValidationError.missingURL))
            return
        }
        url.appendPathComponent(path)
        var urlComponents = URLComponents()
        urlComponents.scheme = url.scheme
        urlComponents.host = url.host
        urlComponents.path = url.path
        urlComponents.queryItems = queryItems
        var urlRequest = URLRequest(url: url)
        urlRequest.httpBody = body
        urlRequest.allHTTPHeaderFields = httpHeaders
        urlRequest.httpMethod = httpMethod.rawValue

        let urlSession = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(ValidationError.defaultError))
                return
            }
            
            if httpResponse.statusCode == 400 {
                completion(.failure(ValidationError.requestError))
                return
            } else if httpResponse.statusCode == 500 {
                completion(.failure(ValidationError.serverError))
                return
            }
            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(ValidationError.defaultError))
            }
        })
        urlSession.resume()
        
    }
    
    public func get(url: String,
                    path: String,
                    body: Data?,
                    httpHeaders: [String: String]?,
                    queryItems: [URLQueryItem]?,
                    completion: @escaping(Result <Data, Error>) -> Void) {
        sendRequest(url: url,
                    path: path,
                    body: body,
                    httpMethod: HTTPMethod.get,
                    httpHeaders: httpHeaders,
                    queryItems:queryItems,
                    completion: completion)
    }
    
    public func put(url: String, path: String, body: Data?, httpHeaders: [String : String]?, completion: @escaping (Result<Data, Error>) -> Void) {
        sendRequest(url: url,
                    path: path,
                    body: body,
                    httpMethod: HTTPMethod.put,
                    httpHeaders: httpHeaders,
                    queryItems: nil,
                    completion: completion)
    }
    
    public func post(url: String,
                     path: String,
                     body: Data?,
                     httpHeaders: [String: String]?,
                     completion: @escaping(Result <Data, Error>) -> Void) {
        sendRequest(url: url,
                    path: path,
                    body: body,
                    httpMethod: HTTPMethod.post,
                    httpHeaders: httpHeaders,
                    queryItems: nil,
                    completion: completion)
    }
    
    public func delete(url: String,
                       path: String,
                       body: Data?,
                       httpHeaders: [String: String]?,
                       completion: @escaping(Result <Data, Error>) -> Void) {
        sendRequest(url: url,
                    path: path,
                    body: body,
                    httpMethod: HTTPMethod.delete,
                    httpHeaders: httpHeaders,
                    queryItems: nil,
                    completion: completion)
    }
}

extension NetworkServiceImp: URLSessionDelegate {
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge,
                           completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
        
        completionHandler(.useCredential, urlCredential)
    }
}
