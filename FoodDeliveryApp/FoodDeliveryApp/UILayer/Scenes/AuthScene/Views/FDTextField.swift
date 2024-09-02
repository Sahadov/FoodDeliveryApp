//
//  FDTextField.swift
//  FoodDeliveryApp
//
//  Created by Дмитрий Волков on 02.09.2024.
//

import UIKit

class FDTextField: UITextField {

    
    init(_ placeholderText: String?){
        super.init(frame: .zero)
        setupLayout(placeholderText: placeholderText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout(placeholderText: String?){
        self.layer.cornerRadius = 24
        self.backgroundColor = Colors.grey
        self.font = .Roboto.regular.size(of: 16)
        self.placeholder = placeholderText
        
        // add paddings to the textfield
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }

}
