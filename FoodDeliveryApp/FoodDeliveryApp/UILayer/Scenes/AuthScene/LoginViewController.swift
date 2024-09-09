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
    private var state: LoginState = .initial
    weak var viewOutput: LoginViewOutput!
    
    // MARK: - Views
    private lazy var bottomView = FDBottomView()
    private lazy var textField = FDTextField("Type your name")
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
        case .signUp:
            setupBottomView()
        }
        //setupTextField()
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
    func setupTextField(){
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    func setupLogoImage(){
        view.addSubview(logoImage)
        logoImage.image = UIImage(named: "noodleLogo2")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 90),
            logoImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 320),
            logoImage.heightAnchor.constraint(equalToConstant: 320)
        ])
        
    }
    func setupSignInButton(){
        view.addSubview(signInButton)
        signInButton.type = .blue
        signInButton.setTitle("Log In")
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    func setupSignUpButton(){
        view.addSubview(signUpButton)
        signUpButton.type = .purple
        signUpButton.setTitle("Sign up")
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 15),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
}

extension LoginViewController: LoginViewInput {
    func onSignInTapped() {
        
    }
    
    func onSignUpTapped() {
        
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
