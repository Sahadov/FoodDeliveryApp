//
//  Coordinator.swift
//  FoodDeliveryApp
//
//  Created by Дмитрий Волков on 19.08.2024.
//

import UIKit

enum CoordinatorType {
    case app
    case onboardong
    case home
    case order
    case list
    case profile
}

// MARK: - Coordinator Protocol

protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var type: CoordinatorType { get }
    var navigationController: UINavigationController? { get set }
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    
    func start()
    func finish()
}

extension CoordinatorProtocol {
    func addChildCoordinator(_ childCoordinator: CoordinatorProtocol){
        childCoordinators.append(childCoordinator)
    }
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol){
        childCoordinators = childCoordinators.filter{ $0 !== childCoordinator }
    }
}

// MARK: - Coordinator Delegates

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol)
}
