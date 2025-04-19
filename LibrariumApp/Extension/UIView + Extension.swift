//
//  UIView + Extension.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 18/04/25.
//

import Foundation
import UIKit

extension UIView {
    
    func pin(to superView: UIView) {
            translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
                leadingAnchor.constraint(equalTo: superView.leadingAnchor),
                trailingAnchor.constraint(equalTo: superView.trailingAnchor),
                bottomAnchor.constraint(equalTo: superView.bottomAnchor)])
        }
    
}

