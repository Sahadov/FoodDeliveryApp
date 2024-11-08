//
//  LoginViewController.swift
//  FoodDeliveryApp
//
//  Created by Дмитрий Волков on 30.08.2024.
//

import UIKit

enum LoginState {
    case initial
    case login
    case signUp
}

protocol LoginViewInput: AnyObject {
    func onSignInTapped()
    func onSignUpTapped()
    func onFacebookTapped()
    func onGoogleTapped()
    func onForgotTapped()
    func onBackPressed()
}

class LoginViewController: UIViewController {

    // MARK: - Properties
    private var state: LoginState = .login
    var viewOutput: LoginViewOutput!
    
    // MARK: - Views
    private lazy var bottomView = FDBottomView()
    private lazy var titleLabel = UILabel()
    private lazy var usernameField = FDTextField("Type your name")
    private lazy var passwordField = FDTextField("Type your password")
    private lazy var confirmPasswordField = FDTextField("Confirm your password")
    private lazy var forgotButton = UIButton()
    private lazy var logoImage = UIImageView()
    private lazy var signInButton = FDButton()
    private lazy var signUpButton = FDButton()
    
    // MARK: - Initializers
    init(viewOtput: LoginViewOutput, state: LoginState){
        super.init(nibName: nil, bundle: nil)
        self.viewOutput = viewOtput
        self.state = state
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
    }
    
    func facebookPressed(){
        print("Facebook pressed")
    }
    func googlePressed(){
        print("Google pressed")
    }

}

// MARK: - Layout
private extension LoginViewController {
    func setupLayout(){
        view.backgroundColor = Colors.bgWhite
        switch state {
        case .initial:
            setupBottomView()
            setupLogoImage()
            setupSignInButton()
            setupSignUpButton()
        case .login:
            setupBottomView()
            setupLogoImage()
            setupTitleLabel("Sign In")
            setupUsernameField()
            setupPasswordField()
            setupSignInButton()
        case .signUp:
            setupLogoImage()
            setupTitleLabel("Sign Up")
            setupUsernameField()
            setupPasswordField()
            setupConfirmPasswordField()
            setupSignInButton()
        }
    }
    func setupBottomView(){
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomView.button1Action = facebookPressed
        bottomView.button2Action = googlePressed
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    func setupTitleLabel(_ title: String){
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = title
        titleLabel.font = .Roboto.bold.size(of: 24)
        titleLabel.textColor = Colors.btnBlue
        titleLabel.textAlignment = .left
    
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: -15)
        ])
    }
    func setupUsernameField(){
        view.addSubview(usernameField)
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            usernameField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            usernameField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            usernameField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            usernameField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupPasswordField(){
        view.addSubview(passwordField)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passwordField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            passwordField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 20),
            passwordField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupConfirmPasswordField(){
        view.addSubview(confirmPasswordField)
        confirmPasswordField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            confirmPasswordField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            confirmPasswordField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            confirmPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            confirmPasswordField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupLogoImage(){
        view.addSubview(logoImage)
        logoImage.image = UIImage(named: "noodleLogo2")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 45),
            logoImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 320),
            logoImage.heightAnchor.constraint(equalToConstant: 320)
        ])
        
    }
    func setupSignInButton(){
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.type = .blue
        signInButton.setTitle("Log In")
        signInButton.action = onSignInTapped
        
        switch state {
            case .initial:
                NSLayoutConstraint.activate([
                    signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                    signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                    signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
                    signInButton.heightAnchor.constraint(equalToConstant: 50)
                ])
            case .login:
                NSLayoutConstraint.activate([
                    signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 40),
                    signInButton.heightAnchor.constraint(equalToConstant: 50)
                ])
            case .signUp:
                signInButton.type = .blue
                signInButton.setTitle("Sign up")
                NSLayoutConstraint.activate([
                    signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    signInButton.topAnchor.constraint(equalTo: confirmPasswordField.bottomAnchor, constant: 40),
                    signInButton.heightAnchor.constraint(equalToConstant: 50)
                ])
        }
    }
    func setupSignUpButton(){
        view.addSubview(signUpButton)
        signUpButton.type = .purple
        signUpButton.setTitle("Sign up")
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.action = onSignUpTapped
        NSLayoutConstraint.activate([
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 15),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - LoginViewInput Delegate
extension LoginViewController: LoginViewInput {
    func onSignInTapped() {
        switch state {
        case .initial:
            viewOutput.goToSignIn()
        case .login:
            return
        case .signUp:
            return
        }
    }
    
    func onSignUpTapped() {
        switch state {
        case .initial:
            viewOutput.goToSignUp()
        case .login:
            return
        case .signUp:
            return
        }
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
    
    func onBackPressed() {
        
    }
    
}
