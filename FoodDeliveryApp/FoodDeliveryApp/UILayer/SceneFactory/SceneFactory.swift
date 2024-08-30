//
//  SceneFactory.swift
//  FoodDeliveryApp
//
//  Created by Дмитрий Волков on 30.08.2024.
//

import UIKit

struct SceneFactory {
    
    // MARK: - Onboarding
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
}
