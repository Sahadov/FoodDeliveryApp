//
//  ViewController.swift
//  FoodDeliveryApp
//
//  Created by Дмитрий Волков on 15.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var titleLable: UILabel = {
        var element = UILabel()
        element.text = "NEW LABEL"
        element.textColor = Colors.black
        element.font = .Roboto.thinItalic.size(of: 40)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.accentOrange
        
        view.addSubview(titleLable)
        
        NSLayoutConstraint.activate([
            titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLable.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

