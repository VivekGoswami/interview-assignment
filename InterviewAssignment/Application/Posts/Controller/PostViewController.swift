//
//  PostViewController.swift
//  InterviewAssignment
//
//  Created by Vivek Goswami on 28/05/24.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var postTable: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var viewModel = PostViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postTable.registerCell(type: PostCell.self)
        activityIndicator.startAnimating()
        viewModel.getAllPostWithPage()
        
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.postTable.reloadData()
            }
        }
    }
}

extension PostViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.postCellViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostCell = tableView.dequeueReusableCell(for: indexPath)
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellVM
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard 
            let vc: PostDetailViewController = storyboard?.instantiateVC() else { return }
        vc.post = viewModel.posts[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == viewModel.postCellViewModel.count - 1 && !viewModel.isLoading {
            activityIndicator.startAnimating()
            viewModel.getAllPostWithPage()
        }
    }
}

