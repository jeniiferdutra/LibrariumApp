//
//  HomeScreen.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 15/04/25.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func tappedLoginButton()
    func tappedGoogleButton()
    func tappedGithubButton()
    func tappedRegisterButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    public func delegate(delegate: LoginScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var logoImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "logo2")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var loginLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 25)
        title.text = "Sign In"
        return title
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
    
    lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sign In", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 25
        btn.backgroundColor = .lightGray
        btn.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedLoginButton() {
        self.delegate?.tappedLoginButton()
    }
    
    lazy var signInLabel: UILabel = {
        let signIn = UILabel()
        signIn.translatesAutoresizingMaskIntoConstraints = false
        signIn.text = "Or sign in with"
        signIn.textColor = .black
        signIn.font = UIFont.systemFont(ofSize: 15)
        return signIn
    }()
    
    lazy var googleButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .lightGray
        btn.setImage(UIImage(named: "google")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.addTarget(self, action: #selector(tappedGoogleButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedGoogleButton() {
        self.delegate?.tappedGoogleButton()
    }
    
    lazy var githubButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .lightGray
        btn.setImage(UIImage(named: "github")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.addTarget(self, action: #selector(tappedGithubButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedGithubButton() {
        self.delegate?.tappedGithubButton()
    }
    
    lazy var registerLabel: UILabel = {
        let register = UILabel()
        register.translatesAutoresizingMaskIntoConstraints = false
        register.textColor = .black
        register.font = UIFont.systemFont(ofSize: 15)
        register.text = "New member?"
        return register
    }()
    
    lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sign Up", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedRegisterButton() {
        self.delegate?.tappedRegisterButton()
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
        addSubview(loginLabel)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(signInLabel)
        addSubview(googleButton)
        addSubview(githubButton)
        addSubview(registerLabel)
        addSubview(registerButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 280),
            logoImageView.heightAnchor.constraint(equalToConstant: 160),
            
            loginLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            emailLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30),
            emailLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            emailTextField.heightAnchor.constraint(equalToConstant: 55),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25),
            passwordLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 45),
            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            signInLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            signInLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            googleButton.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 15),
            googleButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -30),
            googleButton.heightAnchor.constraint(equalToConstant: 45),
            googleButton.widthAnchor.constraint(equalToConstant: 45),
            
            githubButton.topAnchor.constraint(equalTo: googleButton.topAnchor),
            githubButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 30),
            githubButton.heightAnchor.constraint(equalToConstant: 45),
            githubButton.widthAnchor.constraint(equalToConstant: 45),
            
            registerLabel.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: 50),
            registerLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            
            registerButton.topAnchor.constraint(equalTo: registerLabel.bottomAnchor),
            registerButton.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor)
        ])
    }
    
    public func configTextFields(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
}
