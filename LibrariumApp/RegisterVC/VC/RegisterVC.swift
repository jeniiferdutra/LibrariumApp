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
        registerScreen?.configTextField(delegate: self)
    }

}

extension RegisterVC: RegisterScreenProtocol {
    func tappedRegisterButton() {
        let vc: HomeVC = HomeVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func tappedLoginButton() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let name: String = registerScreen?.nameTextField.text ?? ""
        let email: String = registerScreen?.emailTextField.text ?? ""
        let password: String = registerScreen?.passwordTextField.text ?? ""
        
        if !name.isEmpty && !email.isEmpty && !password.isEmpty {
            registerScreen?.registerButton.isEnabled = true
            registerScreen?.registerButton.backgroundColor = .black
        } else {
            registerScreen?.registerButton.isEnabled = false
            registerScreen?.registerButton.backgroundColor = .black
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()
        return false
    }
    
}
