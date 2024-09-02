//
//  SceneFactory.swift
//  FoodDeliveryApp
//
//  Created by Дмитрий Волков on 30.08.2024.
//

import UIKit

struct SceneFactory {
    
    // MARK: - Onboarding Flow
    static func makeOnboardingFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate, navigationController: UINavigationController){
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: finishDelegate)
        coordinator.addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    static func makeOnboargingScene(coordinator: OnboardingCoordinator) -> OnboardingViewController {
        var pages = [UIViewController]()
        
        let firstVC = OnboardingPartViewController()
        firstVC.imageToShow = UIImage(named: "chicken")
        firstVC.titleText = "Delicious Food"
        firstVC.descriptionText = "Try our best dishes cooked for you by our team shefs"
        
        let secondVC = OnboardingPartViewController()
        secondVC.imageToShow = UIImage(named: "shipped")
        secondVC.titleText = "Fast Delivery"
        secondVC.descriptionText = "The delivery to your door will take no more than 30 minutes"
        
        let thirdVC = OnboardingPartViewController()
        thirdVC.imageToShow = UIImage(named: "medal")
        thirdVC.titleText = "High Quality"
        thirdVC.descriptionText = "We use only products from our reliable local farms"
        
        let fourthVC = OnboardingPartViewController()
        fourthVC.imageToShow = UIImage(named: "credit-card")
        fourthVC.titleText = "Payment Online"
        fourthVC.descriptionText = "Pay for your order using your favourite online-payment"
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourthVC)
        
        let presenter = OnboardingViewPresenter(coordinator: coordinator)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        
        return viewController
    }
    
    // MARK: - Main Flow
    static func makeMainFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate) -> TabBarController {
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "scribble"), tag: 0)
        homeCoordinator.finishDelegate = finishDelegate
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: UIImage.init(systemName: "scribble"), tag: 1)
        orderCoordinator.finishDelegate = finishDelegate
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
        listNavigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "scribble"), tag: 2)
        listCoordinator.finishDelegate = finishDelegate
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "scribble"), tag: 3)
        profileCoordinator.finishDelegate = finishDelegate
        profileCoordinator.start()
        
        coordinator.addChildCoordinator(homeCoordinator)
        coordinator.addChildCoordinator(orderCoordinator)
        coordinator.addChildCoordinator(listCoordinator)
        coordinator.addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        
        return tabBarController
    }
}
