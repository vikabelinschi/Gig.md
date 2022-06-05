//
//  NetworkConstants.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 22.05.2022.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public enum ValidationError: Error, Equatable {
    case defaultError
    case missingURL
    case serverError
    case encodingError
    case requestError
}

extension ValidationError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .defaultError:
            return "Session timeout"
        case .missingURL:
            return "Error unwrapping url"
        case .serverError:
            return "Error from http response"
        case .encodingError:
            return "Error unwrapping decoded data"
        case .requestError:
            return "Bad request"
        }
    }
}
