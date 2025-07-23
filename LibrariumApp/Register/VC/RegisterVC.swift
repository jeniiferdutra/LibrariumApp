//
//  RegisterVC.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 16/04/25.
//

import UIKit

class RegisterVC: UIViewController {
    
    private var registerScreen: RegisterScreen?
    private var viewModel: RegisterViewModel = RegisterViewModel()
    
    override func loadView() {
        registerScreen = RegisterScreen()
        view = registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.delegate(delegate: self)
        registerScreen?.configTextField(delegate: self)
        viewModel.delegate(delegate: self)

    }

}

extension RegisterVC: RegisterScreenProtocol {
    func tappedRegisterButton() {
        viewModel.registerUser(email: registerScreen?.emailTextField.text ?? "", password: registerScreen?.passwordTextField.text ?? "")
    }
    
    func tappedLoginButton() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension RegisterVC: RegisterViewModelProtocol {
    func sucessRegister() {
        let vc: HomeVC = HomeVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func errorRegister(errorMessage: String) {
        print(#function)
        Alert(controller: self).showAlertInformation(title: "Ops, error Register!", message: errorMessage)
    }
    
    
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let email: String = registerScreen?.emailTextField.text ?? ""
        let password: String = registerScreen?.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            registerScreen?.registerButton.isEnabled = true
            registerScreen?.registerButton.backgroundColor = .black
        } else {
            registerScreen?.registerButton.isEnabled = false
            registerScreen?.registerButton.backgroundColor = .lightGray
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == registerScreen?.emailTextField {
            registerScreen?.passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
}
