//
//  BottomView.swift
//  FoodDeliveryApp
//
//  Created by Дмитрий Волков on 30.08.2024.
//

import UIKit

class BottomView: UIView {

    private let label = UILabel()
    private let view1 = UIView()
    private let view2 = UIImageView()
    private let button1 = UIButton()
    private let button2 = UIButton()
    
    var button1Action: (() -> Void)?
    var button2Action: (() -> Void)?
    
    init(){
        super.init(frame: .zero)
        setupLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayOut(){
        setupLabel()
        setupView1()
        setupView2()
        setupButton1()
        setupButton2()
    }
    
    private func setupLabel(){
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "or connect with"
        label.font = .Roboto.regular.size(of: 14)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        ])
        
    }
    private func setupView1(){
        self.addSubview(view1)
        view1.backgroundColor = Colors.gray4
        view1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view1.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            view1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view1.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -12),
            view1.heightAnchor.constraint(equalToConstant: 3)
        ])
        
    }
    private func setupView2(){
        self.addSubview(view2)
        view2.image = UIImage(named: "wingsImage")
        view2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 5),
            view2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -10),
            view2.heightAnchor.constraint(equalToConstant: 200),
            view2.widthAnchor.constraint(equalToConstant: 220)
        ])
        
    }
    private func setupButton2(){
        self.addSubview(button2)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setImage(UIImage(named: "google-plus"), for: .normal)
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            button2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        ])
        
    }
    private func setupButton1(){
        self.addSubview(button1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setImage(UIImage(named: "facebook"), for: .normal)
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80)
        ])
    }
   

}

private extension BottomView {
    @objc func button1Tapped(){
        button1Action?()
    }
    @objc func button2Tapped(){
        button2Action?()
    }
}
