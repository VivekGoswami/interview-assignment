//
//  APIEndpoint.swift
//  InterviewAssignment
//
//  Created by Vivek Goswami on 28/05/24.
//

import Foundation

enum APIEndpoint {

    enum Method: String {
        case get
        case post
        case put
        case delete
    }
    
    case posts(page: Int, limit: Int)
}

extension APIEndpoint {

    /// The path for every endpoint
    var path: String {
        switch self {
            
        case .posts:
            return "/posts"
        }
    }
    
    /// The method for the endpoint
    var method: APIEndpoint.Method {
        switch self {
        case .posts:
            return .get
        }
    }
    
    /// The URL parameters for the endpoint (in case it has any)
    var parameters: [URLQueryItem]? {
        switch self {
        case .posts(let page, let limit):
            var queryItems = [URLQueryItem]()
            queryItems.append(URLQueryItem(name: "_page", value: "\(page)"))
            queryItems.append(URLQueryItem(name: "_limit", value: "\(limit)"))
            
            return queryItems
        }
    }
}
