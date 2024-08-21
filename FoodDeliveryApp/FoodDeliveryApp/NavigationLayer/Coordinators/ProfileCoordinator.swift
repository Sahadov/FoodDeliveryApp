//
//  ProfileCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Дмитрий Волков on 20.08.2024.
//

import UIKit

class ProfileCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .gray
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("ProfileCoordinator finish")
    }
}
