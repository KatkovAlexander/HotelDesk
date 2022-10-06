//
//  RoomServicesConfigurator.swift
//  HotelDesk
//
//  Created by Александр Катков on 07.10.2022.
//  
//

import UIKit

final class RoomServicesConfigurator {
    
    func configure() -> UIViewController {
        guard let viewController = UIStoryboard(name: String(describing: RoomServicesViewController.self), bundle: nil).instantiateInitialViewController() as? RoomServicesViewController else {
            fatalError("Can't load RoomServicesViewController from storyboard")
        }
        
        let router = RoomServicesRouter(transitionHandler: viewController)
        let interactor = RoomServicesInteractor()
        let presenter = RoomServicesPresenter(view: viewController,
                                                           interactor: interactor,
                                                           router: router)
        
        interactor.output = presenter
        viewController.output = presenter
        
        return viewController
    }
}
