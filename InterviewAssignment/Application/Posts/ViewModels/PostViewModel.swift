//
//  PostViewModel.swift
//  InterviewAssignment
//
//  Created by Vivek Goswami on 29/05/24.
//
import Foundation

class PostViewModel: NSObject {
    
    private var postService: PostService
    var reloadTableView: (() -> Void)?
    var posts: [Post] = []
    var pagination: Int = 1
    var isLoading: Bool = false
    
    init(postService: PostService = PostService()) {
        self.postService = postService
    }
    
    var postCellViewModel = [PostCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }
    
    func getAllPostWithPage() {
        
        Task {
            isLoading = true
            await postService.getPostWith(page: pagination) { posts in
                self.fetchData(post: posts)
                if posts.count > 0 {
                    self.isLoading = false
                    self.pagination += 1
                }
            }
        }
    }
    
    func fetchData(post: [Post]) {
        posts.append(contentsOf: post.map { $0 })
        
        var vms = [PostCellViewModel]()
        for p in posts {
            vms.append(createCellModel(post: p))
        }
        postCellViewModel = vms
    }
    
    func createCellModel(post: Post) -> PostCellViewModel {
        let id = "\(post.id)"
        let title = post.title
        let body = post.body
        return PostCellViewModel(id: id, title: title, body: body)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> PostCellViewModel {
        return postCellViewModel[indexPath.row]
    }
}

struct PostCellViewModel {
    var id: String
    var title: String
    var body: String
}
