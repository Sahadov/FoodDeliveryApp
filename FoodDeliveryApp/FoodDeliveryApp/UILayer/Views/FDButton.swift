//
//  FDButton.swift
//  FoodDeliveryApp
//
//  Created by Дмитрий Волков on 02.09.2024.
//

import UIKit

enum ButtonType {
    case white
    case orange
    case grey
}

class FDButton: UIView {

    private let button = UIButton()
    var action: (() -> Void)?
    var type: ButtonType = .white {
        didSet{
            setColor(type: type)
        }
    }
    
    init(type: ButtonType = .white){
        super.init(frame: .zero)
        self.type = type
        setupLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayOut(){
        setupButton()
    }
    
    private func setupButton(){
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 24
        button.titleLabel?.font = .Roboto.bold.size(of: 20)
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        setColor(type: .white)
    }
    
    @objc private func buttonTapped(){
        guard let action = self.action else { return }
        action()
    }
    
    private func setColor(type: ButtonType){
        switch type {
        case .white:
            button.backgroundColor = Colors.white
            button.setTitleColor(Colors.accentOrange, for: .normal)
        case .orange:
            button.backgroundColor = Colors.accentOrange
            button.setTitleColor(Colors.white, for: .normal)
        case .grey:
            button.backgroundColor = Colors.background
            button.setTitleColor(.darkGray, for: .normal)
        }
    }
    
    public func setTitle(_ title: String?){
        button.setTitle(title, for: .normal)
    }

}
