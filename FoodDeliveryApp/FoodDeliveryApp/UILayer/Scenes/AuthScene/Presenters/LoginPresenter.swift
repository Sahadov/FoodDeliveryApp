//
//  LoginViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Дмитрий Волков on 02.09.2024.
//

import Foundation

protocol LoginViewOutput: AnyObject {
    func loginStart()
    func registrationStart()
    func goToFacebookLogin()
    func goToGoogleLogin()
    func goToSignIn()
    func goToSignUp()
    func goToForgotPass()
    func goBack()
}

class LoginPresenter {
    
    private var coordinator: AppCoordinator!
    weak var viewInput: LoginViewInput?

    init(coordinator: AppCoordinator!, viewInput: LoginViewInput? = nil) {
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
}

extension LoginPresenter: LoginViewOutput {
    func loginStart() {
        
    }
    
    func registrationStart() {
        
    }
    
    func goToFacebookLogin() {
        
    }
    
    func goToGoogleLogin() {
        
    }
    
    func goToSignIn() {
        
    }
    
    func goToSignUp() {
        
    }
    
    func goToForgotPass() {
        
    }
    
    func goBack() {
        
    }
    
    
}
