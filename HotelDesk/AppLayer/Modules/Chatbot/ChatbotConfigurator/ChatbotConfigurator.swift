//
//  ChatbotConfigurator.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//  
//

import UIKit

final class ChatbotConfigurator {
    
    func configure() -> UIViewController {
        guard let viewController = UIStoryboard(name: String(describing: ChatbotViewController.self), bundle: nil).instantiateInitialViewController() as? ChatbotViewController else {
            fatalError("Can't load ChatbotViewController from storyboard")
        }
        
        let router = ChatbotRouter(transitionHandler: viewController)
        let interactor = ChatbotInteractor()
        let presenter = ChatbotPresenter(view: viewController,
                                                           interactor: interactor,
                                                           router: router)
        
        interactor.output = presenter
        viewController.output = presenter
        
        return viewController
    }
}
