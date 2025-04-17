//
//  RegisterScreen.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 16/04/25.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func tappedLoginButton()
}

class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenProtocol?
    
    public func delegate(delegate: RegisterScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var logoImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "logo2")
        img.contentMode = .scaleAspectFit
        return img
    }()

    lazy var registerLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 25)
        title.text = "Sign Up"
        return title
    }()
    
    lazy var nameLabel: UILabel = {
        let email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.textColor = .black
        email.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        email.text = "Name"
        return email
    }()
    
    lazy var nameTextField: UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.autocorrectionType = .no
        email.backgroundColor = .white
        email.borderStyle = .none
        email.borderStyle = .roundedRect
        email.keyboardType = .emailAddress
        email.placeholder = "Your name"
        email.textColor = .darkGray
        email.layer.borderWidth = 0.2
        email.clipsToBounds = true
        email.layer.cornerRadius = 10
        return email
    }()
    
    lazy var emailLabel: UILabel = {
        let email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.textColor = .black
        email.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        email.text = "Email"
        return email
    }()
    
    lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.autocorrectionType = .no
        email.backgroundColor = .white
        email.borderStyle = .none
        email.borderStyle = .roundedRect
        email.keyboardType = .emailAddress
        email.placeholder = "Your email"
        email.textColor = .darkGray
        email.layer.borderWidth = 0.2
        email.clipsToBounds = true
        email.layer.cornerRadius = 10
        return email
    }()
    
    lazy var passwordLabel: UILabel = {
        let password = UILabel()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.textColor = .black
        password.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        password.text = "Password"
        return password
    }()
    
    lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.autocorrectionType = .no
        password.backgroundColor = .white
        password.borderStyle = .none
        password.placeholder = "Your Password"
        password.isSecureTextEntry = true
        password.textColor = .darkGray
        password.layer.borderWidth = 0.2
        password.clipsToBounds = true
        password.layer.cornerRadius = 10
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 7, height: 0))
        password.leftViewMode = .always
        return password
    }()
    
    lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sign Up", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 25
        btn.backgroundColor = .black
        // ADD TARGET
        return btn
    }()
    
    lazy var loginLabel: UILabel = {
        let register = UILabel()
        register.translatesAutoresizingMaskIntoConstraints = false
        register.textColor = .black
        register.font = UIFont.systemFont(ofSize: 15)
        register.text = "Alreay a member?"
        return register
    }()
    
    lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sign In", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedLoginButton() {
        self.delegate?.tappedLoginButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(logoImageView)
        addSubview(registerLabel)
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(registerButton)
        addSubview(loginLabel)
        addSubview(loginButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 280),
            logoImageView.heightAnchor.constraint(equalToConstant: 160),
            
            registerLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            registerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            nameLabel.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: registerLabel.leadingAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: registerLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            nameTextField.heightAnchor.constraint(equalToConstant: 55),
            
            emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 25),
            emailLabel.leadingAnchor.constraint(equalTo: registerLabel.leadingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: registerLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25),
            passwordLabel.leadingAnchor.constraint(equalTo: registerLabel.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: registerLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 45),
            registerButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 30),
            loginLabel.leadingAnchor.constraint(equalTo: registerLabel.leadingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: loginLabel.bottomAnchor),
            loginButton.leadingAnchor.constraint(equalTo: registerLabel.leadingAnchor)
            
        ])
    }
}
