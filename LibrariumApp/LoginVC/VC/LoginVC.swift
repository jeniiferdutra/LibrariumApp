//
//  ViewController.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 15/04/25.
//

import UIKit

class LoginVC: UIViewController {
    
    private var loginScreen: LoginScreen?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewWillAppear(_ animated: Bool) { // ocultar a navigation
         navigationController?.navigationBar.isHidden = true
     }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

