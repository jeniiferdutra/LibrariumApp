//
//  Alert.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 23/04/25.
//

import UIKit

class Alert {
    
    private let controller: UIViewController // MARK: Criar uma controller para conseguir acessar o present na linha 22
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    public func showAlertInformation(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(ok)
        controller.present(alertController, animated: true)
    }
}
