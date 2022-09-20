//
//  ProfileConfigurator.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//  
//

import UIKit

final class ProfileConfigurator {
    
    func configure() -> UIViewController {
        guard let viewController = UIStoryboard(name: String(describing: ProfileViewController.self), bundle: nil).instantiateInitialViewController() as? ProfileViewController else {
            fatalError("Can't load ProfileViewController from storyboard")
        }
        
        let router = ProfileRouter(transitionHandler: viewController)
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter(view: viewController,
                                                           interactor: interactor,
                                                           router: router)
        
        interactor.output = presenter
        viewController.output = presenter
        
        return viewController
    }
}
