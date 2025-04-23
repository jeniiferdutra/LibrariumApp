//
//  LoginViewModel.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 22/04/25.
//

import UIKit
import FirebaseAuth

class LoginViewModel {
    
    private var auth = Auth.auth()
    
    public func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("Sucesso login")
            } else {
                print("Error login, error: \(error?.localizedDescription ?? "")")
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
