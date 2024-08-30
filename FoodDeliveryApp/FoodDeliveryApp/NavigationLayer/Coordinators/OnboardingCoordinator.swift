//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Дмитрий Волков on 20.08.2024.
//

import UIKit

// MARK: - OnboardingCoordinator
class OnboardingCoordinator: Coordinator {
    
    // MARK: - Property
    private let factory = SceneFactory.self
    
    // MARK: - Methods
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        print("OnboardingCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

// MARK: - Navigation
private extension OnboardingCoordinator {
    func showOnboarding(){
        let viewController = factory.makeOnboargingScene(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
