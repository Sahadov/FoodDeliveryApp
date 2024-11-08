//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Дмитрий Волков on 19.08.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    override func start() {
        // check if the onboarding has been already watched
        if userStorage.passedOnboarding {
            showMainFlow()
        } else {
            showOnboardingFlow()
        }
        
        let loginPresenter = LoginPresenter(coordinator: self)
        
        let loginVC = LoginViewController(viewOtput: loginPresenter, state: .initial)
        navigationController?.pushViewController(loginVC, animated: true)
        
        
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

// MARK: - Navigation Methods
private extension AppCoordinator {
    func showOnboardingFlow(){
        guard let navigationController = navigationController else { return }
        factory.makeOnboardingFlow(coordinator:self, finishDelegate: self, navigationController: navigationController)
        
    }
    
    func showMainFlow(){
        guard let navigationController = navigationController else { return }
        let tabBarController = factory.makeMainFlow(coordinator: self, finishDelegate: self)
        navigationController.pushViewController(tabBarController, animated: true)
        
    }
    func showAuthFlow(){
        guard let navigationController = navigationController else { return }
        let vc = factory.makeAuthScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}

// MARK: - Methods
extension AppCoordinator {
    func showLoginScene(){
        guard let navigationController = navigationController else { return }
        let vc = factory.makeLoginScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    func showSignupScene(){
        guard let navigationController = navigationController else { return }
        let vc = factory.makeSignupScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .app:
            return
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showAuthFlow()
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
