//
//  QRScannerConfigurator.swift
//  HotelDesk
//
//  Created by Александр Катков on 20.09.2022.
//  
//

import UIKit

final class QRScannerConfigurator {
    
    func configure() -> UIViewController {
        guard let viewController = UIStoryboard(name: String(describing: QRScannerViewController.self), bundle: nil).instantiateInitialViewController() as? QRScannerViewController else {
            fatalError("Can't load QRScannerViewController from storyboard")
        }
        
        let router = QRScannerRouter(transitionHandler: viewController)
        let interactor = QRScannerInteractor()
        let presenter = QRScannerPresenter(view: viewController,
                                                           interactor: interactor,
                                                           router: router)
        
        interactor.output = presenter
        viewController.output = presenter
        
        return viewController
    }
}
