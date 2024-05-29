//
//  PostDetailViewController.swift
//  InterviewAssignment
//
//  Created by Vivek Goswami on 29/05/24.
//

import UIKit

class PostDetailViewController: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Post Detail"
        self.showDetails()
    }
    
    func showDetails() {
        self.idLabel.text = "\(post?.id ?? 0)"
        self.titleLabel.text = post?.title
        self.bodyLabel.text = post?.body
    }
}
