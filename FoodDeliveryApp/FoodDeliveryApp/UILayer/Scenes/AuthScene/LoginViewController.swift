//
//  LoginViewController.swift
//  FoodDeliveryApp
//
//  Created by Дмитрий Волков on 30.08.2024.
//

import UIKit

class LoginViewController: UIViewController {

    private let bottomView = BottomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
        setupBottomView()
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
}
