//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Дмитрий Волков on 20.08.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    private let factory = SceneFactory.self
    
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        print("OnboardingCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

private extension OnboardingCoordinator {
    func showOnboarding(){
        let viewController = factory.makeOnboargingScene(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
