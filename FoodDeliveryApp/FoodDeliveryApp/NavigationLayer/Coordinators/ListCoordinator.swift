//
//  listCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Дмитрий Волков on 20.08.2024.
//

import UIKit

class ListCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .purple
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("ListCoordinator finish")
    }
}
