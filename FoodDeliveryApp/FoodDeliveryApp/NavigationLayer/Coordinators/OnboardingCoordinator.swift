//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Дмитрий Волков on 20.08.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .green
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("OnboardingCoordinator finish")
    }
}
