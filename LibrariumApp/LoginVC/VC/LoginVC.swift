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
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewWillAppear(_ animated: Bool) { // ocultar a navigation
         navigationController?.navigationBar.isHidden = true
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFields(delegate: self)
        viewModel.delegate(delegate: self)
    }

}

extension LoginVC: LoginScreenProtocol {
    func tappedLoginButton() {
        viewModel.login(email: loginScreen?.emailTextField.text ?? "", password: loginScreen?.passwordTextField.text ?? "")
    }
    
    func tappedRegisterButton() {
        let vc = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
        // fatalError() -> Forçar erro para testa o Crashlytics
    }
    
}

extension LoginVC: LoginViewModelProtocol {
    func sucessLogin() {
        let vc: HomeVC = HomeVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func errorLogin(errorMessage: String) { // MARK: Ter um alert de informaçao
        print(#function)
        Alert(controller: self).showAlertInformation(title: "Ops, error Login!", message: errorMessage)
    }
    
    
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {

            let email: String = loginScreen?.emailTextField.text ?? ""
            let password: String = loginScreen?.passwordTextField.text ?? ""
            
            if !email.isEmpty && !password.isEmpty {
                loginScreen?.loginButton.isEnabled = true
                loginScreen?.loginButton.backgroundColor = .black
            } else {
                loginScreen?.loginButton.isEnabled = false
                loginScreen?.loginButton.backgroundColor = .lightGray
            }
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {

            textField.resignFirstResponder()
            return false
        }
}
