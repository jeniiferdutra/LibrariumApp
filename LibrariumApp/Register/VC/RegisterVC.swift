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
        viewModel.delegate(delegate: self)
        registerScreen?.delegate(delegate: self)
        registerScreen?.configTextField(delegate: self)
        dismissKeyboard()
        isEnabledRegisterButton(false)
    }
    
    func validateTextField() {
        let email = registerScreen?.emailTextField.text ?? ""
        let password = registerScreen?.passwordTextField.text ?? ""
        
        let isValid = email.isValid(validType: .email) &&
                      password.isValid(validType: .password)
        
        isEnabledRegisterButton(isValid)
    }
    
    func isEnabledRegisterButton(_ isEnabled: Bool) {
        if isEnabled {
            registerScreen?.registerButton.setTitleColor(.black, for: .normal)
            registerScreen?.registerButton.isEnabled = true
            registerScreen?.registerButton.alpha = 1
        } else {
            registerScreen?.registerButton.setTitleColor(.black, for: .normal)
            registerScreen?.registerButton.isEnabled = false
            registerScreen?.registerButton.alpha = 0.4
        }
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
        let vc: HomeViewController = HomeViewController()
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
        
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            switch textField {
            case self.registerScreen?.emailTextField:
                if (registerScreen?.emailTextField.text ?? "").isValid(validType: .email) {
                    registerScreen?.emailTextField.layer.borderWidth = 1
                    registerScreen?.emailTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    registerScreen?.emailTextField.layer.borderWidth = 1.5
                    registerScreen?.emailTextField.layer.borderColor = UIColor.red.cgColor
                }
            case self.registerScreen?.passwordTextField:
                if (registerScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
                    registerScreen?.passwordTextField.layer.borderWidth = 1
                    registerScreen?.passwordTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    registerScreen?.passwordTextField.layer.borderWidth = 1.5
                    registerScreen?.passwordTextField.layer.borderColor = UIColor.red.cgColor
                }
            default:
                break
            }
        }
        validateTextField()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == registerScreen?.emailTextField {
            registerScreen?.passwordTextField.becomeFirstResponder() // vai para o próx campo
        } else {
            textField.resignFirstResponder() // fecha o teclado no último campo
        }
        return true
    }
}

