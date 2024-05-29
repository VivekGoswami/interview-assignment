//
//  UITableView+Extension.swift
//  InterviewAssignment
//
//  Created by Vivek Goswami on 29/05/24.
//

import UIKit

extension UITableViewCell {
    @objc class var identifier: String {
        return String(describing: self)
    }
}
/// Tableview reload in main thread
extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell")
        }
        return cell
    }
    
    func registerCell(type: UITableViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: identifier ?? cellId)
    }
}
