//
//  LoginConfigurator.swift
//  HotelDesk
//
//  Created by Александр Катков on 19.09.2022.
//

import UIKit

final class LoginConfigurator {
    
    func configure() -> UIViewController {
        guard let viewController = UIStoryboard(name: String(describing: LoginViewController.self), bundle: nil).instantiateInitialViewController() as? LoginViewController else {
            fatalError("Can't load LoginViewController from storyboard")
        }
        
        let router = LoginRouter(transitionHandler: viewController)
        
        let presenter = LoginPresenter(view: viewController,
                                       router: router)
        
        viewController.output = presenter
        
        return viewController
    }
}
