//
//  LoginViewModel.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 22/04/25.
//

import UIKit
import FirebaseAuth

protocol LoginViewModelProtocol: AnyObject {
    func sucessLogin()
    func errorLogin(errorMessage: String)
}

class LoginViewModel {
    
    private weak var delegate: LoginViewModelProtocol?
    private var auth = Auth.auth()
    
    public func delegate(delegate: LoginViewModelProtocol?) { // MARK: Método para assinar o nosso protocolo
        self.delegate = delegate
    }
    
    public func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("Sucesso login")
                self.delegate?.sucessLogin()
            } else {
                print("Error login, error: \(error?.localizedDescription ?? "")")
                self.delegate?.errorLogin(errorMessage: error?.localizedDescription ?? "")
            }
        }
    }
    
    public func registerUser(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("Sucesso cadastro")
            } else {
                print("Error cadastro, error: \(error?.localizedDescription ?? "")")
            }
        }
    }

}
