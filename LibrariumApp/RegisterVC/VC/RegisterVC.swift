//
//  RegisterVC.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 16/04/25.
//

import UIKit

class RegisterVC: UIViewController {
    
    private var registerScreen: RegisterScreen?
    
    override func loadView() {
        registerScreen = RegisterScreen()
        view = registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.delegate(delegate: self)
    }

}

extension RegisterVC: RegisterScreenProtocol {
    func tappedLoginButton() {
        navigationController?.popViewController(animated: true)
    }
    
}
