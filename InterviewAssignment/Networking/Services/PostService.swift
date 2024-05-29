//
//  PostService.swift
//  InterviewAssignment
//
//  Created by Vivek Goswami on 29/05/24.
//

import Foundation

class PostService: NSObject {
    
    func getPostWith(page: Int, completion : @escaping ([Post]) -> ()) async {
        do {
           let resposnse: [Post] = try await APIManager.shared.getData(from: .posts(page: page, limit: 10))
            completion(resposnse)
        } catch {
           print(error.localizedDescription)
        }
    }
}
