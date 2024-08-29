//
//  OnboardingViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Дмитрий Волков on 21.08.2024.
//

import UIKit

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}


class OnboardingViewPresenter: OnboardingViewOutput {
   
    
    // MARK: - Properties
    weak var coordinator: OnboardingCoordinator!
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    func onboardingFinish() {
        coordinator.finish()
    }
    
    
}
