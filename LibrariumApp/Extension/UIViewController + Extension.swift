//
//  UIViewController + Extension.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 23/07/25.
//

import Foundation
import UIKit

extension UIViewController {
    func dismissKeyboard() { // fechar teclado
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}
