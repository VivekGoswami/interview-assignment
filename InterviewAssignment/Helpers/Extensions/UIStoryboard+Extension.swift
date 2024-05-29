//
//  UIStoryboard+Extension.swift
//  InterviewAssignment
//
//  Created by Vivek Goswami on 29/05/24.
//

import UIKit

extension UIStoryboard {
    func instantiateVC<T: UIViewController>() -> T? {
        // get a class name and demangle for classes in Swift
        if let name = NSStringFromClass(T.self).components(separatedBy:".").last {
            return instantiateViewController(withIdentifier: name) as? T
        }
        return nil
    }
}
