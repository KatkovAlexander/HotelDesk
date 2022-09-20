//
//  UIViewController+transitionHandler.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//

import Foundation
import UIKit

protocol TransitionHandler: AnyObject {
    
    func push(_ viewController: UIViewController)
    
    func back()
}

extension UIViewController: TransitionHandler {
    
    func push(_ viewController: UIViewController) {
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func back() {
        navigationController?.popViewController(animated: true)
    }
}
