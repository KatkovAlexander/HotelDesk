//
//  AlarmConfigurator.swift
//  HotelDesk
//
//  Created by Александр Катков on 08.10.2022.
//  
//

import UIKit
import PanModal

final class AlarmConfigurator {
    
    func configure() -> UIViewController & PanModalPresentable {
        guard let viewController = UIStoryboard(name: String(describing: AlarmViewController.self), bundle: nil).instantiateInitialViewController() as? AlarmViewController else {
            fatalError("Can't load AlarmViewController from storyboard")
        }
        
        let router = AlarmRouter(transitionHandler: viewController)
        let interactor = AlarmInteractor()
        let presenter = AlarmPresenter(view: viewController,
                                                           interactor: interactor,
                                                           router: router)
        
        interactor.output = presenter
        viewController.output = presenter
        
        return viewController
    }
}
