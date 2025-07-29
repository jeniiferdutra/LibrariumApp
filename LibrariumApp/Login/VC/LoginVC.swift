//
//  ViewController.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 15/04/25.
//

import UIKit

class LoginVC: UIViewController {
    
    private var loginScreen: LoginScreen?
    private var viewModel: LoginViewModel = LoginViewModel()
    private var alert: Alert?
    
    override func loadView() {
        loginScreen = LoginScreen()
        alert = Alert(controller: self)
        view = loginScreen
    }
    
    override func viewWillAppear(_ animated: Bool) { // ocultar a navigation
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFields(delegate: self)
        viewModel.delegate(delegate: self)
//        loginScreen?.emailTextField.text = "test@test.com"
//        loginScreen?.passwordTextField.text = "123456"
        isEnabledLoginButton(false)
    }
    
    func validateTextField() {
        if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) && (loginScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
            isEnabledLoginButton(true)
        } else {
            isEnabledLoginButton(false)
        }
    }
    
    func isEnabledLoginButton(_ isEnabled: Bool) {
        if isEnabled {
            loginScreen?.loginButton.setTitleColor(.black, for: .normal)
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.loginButton.alpha = 1
        } else {
            loginScreen?.loginButton.setTitleColor(.black, for: .normal)
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.loginButton.alpha = 0.4
        }
    }
}

extension LoginVC: LoginScreenProtocol {
    func tappedGoogleButton() {
        viewModel.loginWithGoogle(presentingViewController: self)
    }
    
    func tappedGithubButton() {
        viewModel.loginWithGitHub(presentingViewController: self)
    }
    
    func tappedLoginButton() {
        viewModel.login(email: loginScreen?.emailTextField.text ?? "", password: loginScreen?.passwordTextField.text ?? "")
    }
    
    func tappedRegisterButton() {
        let vc = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            switch textField {
            case self.loginScreen?.emailTextField:
                if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) {
                    loginScreen?.emailTextField.layer.borderWidth = 1
                    loginScreen?.emailTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    loginScreen?.emailTextField.layer.borderWidth = 1.5
                    loginScreen?.emailTextField.layer.borderColor = UIColor.red.cgColor
                }
            case self.loginScreen?.passwordTextField:
                if (loginScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
                    loginScreen?.passwordTextField.layer.borderWidth = 1
                    loginScreen?.passwordTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    loginScreen?.passwordTextField.layer.borderWidth = 1.5
                    loginScreen?.passwordTextField.layer.borderColor = UIColor.red.cgColor
                }
            default:
                break
            }
        }
        validateTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginScreen?.emailTextField {
            loginScreen?.passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}


extension LoginVC: LoginViewModelProtocol {
    func sucessGoogleLogin() {
        sucessLogin()
    }
    
    func errorGoogleLogin(errorMessage: String) {
        alert?.showAlertInformation(title: "Erro ao fazer login", message: errorMessage)
    }
    
    func sucessLogin() {
        let vc: HomeVC = HomeVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func errorLogin(errorMessage: String) {
        alert?.showAlertInformation(title: "Falha no Login", message: errorMessage)
    }
}

