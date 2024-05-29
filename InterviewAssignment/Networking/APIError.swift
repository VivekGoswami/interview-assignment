//
//  APIError.swift
//  InterviewAssignment
//
//  Created by Vivek Goswami on 28/05/24.
//

import Foundation

enum APIError: Error {
    case invalidPath
}

extension APIError {
    
    var description: String {
        switch self {
        case .invalidPath:
            return "Invalid Path"
        }
    }
}
