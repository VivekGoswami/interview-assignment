//
//  APIManager.swift
//  InterviewAssignment
//
//  Created by Vivek Goswami on 28/05/24.
//

import Foundation

final class APIManager {
    
    typealias NetworkResponse = (data: Data, response: URLResponse)
    
    static let shared = APIManager()
    
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
      
    func getData<D: Decodable>(from endpoint: APIEndpoint) async throws -> D {
        let request = try createRequest(from: endpoint)
        let response: NetworkResponse = try await session.data(for: request)
        return try decoder.decode(D.self, from: response.data)
    }
    
    func sendData<D: Decodable, E: Encodable>(from endpoint: APIEndpoint, with body: E) async throws -> D {
        let request = try createRequest(from: endpoint)
        let data = try encoder.encode(body)
        let response: NetworkResponse = try await session.upload(for: request, from: data)
        return try decoder.decode(D.self, from: response.data)
    }
}

private extension APIManager {
    
    func createRequest(from endpoint: APIEndpoint) throws -> URLRequest {
        guard
            var urlComponents = URLComponents(string: APIHelper.baseURL.appending(endpoint.path))
        else {
            throw APIError.invalidPath
        }
        
        if let parameters = endpoint.parameters {
            urlComponents.queryItems = parameters
        }
        
        guard let url = urlComponents.url else {
            throw APIError.invalidPath
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
