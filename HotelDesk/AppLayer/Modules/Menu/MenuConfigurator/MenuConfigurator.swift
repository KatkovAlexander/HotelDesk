//
//  MenuConfigurator.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//  
//

import UIKit

final class MenuConfigurator {
    
    func configure() -> UIViewController {
        guard let viewController = UIStoryboard(name: String(describing: MenuViewController.self), bundle: nil).instantiateInitialViewController() as? MenuViewController else {
            fatalError("Can't load MenuViewController from storyboard")
        }
        
        let router = MenuRouter(transitionHandler: viewController)
        let interactor = MenuInteractor()
        let presenter = MenuPresenter(view: viewController,
                                      interactor: interactor,
                                      router: router)
        
        interactor.output = presenter
        viewController.output = presenter
        
        return viewController
    }
}
