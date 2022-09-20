//
//  MenuPresenter.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//  
//

import Foundation

class MenuPresenter {

    // MARK: Dependencies
    
    private weak var view:  MenuViewControllerInput?
    private let interactor: MenuInteractorInput
    private let router: MenuRouterInput
    
    init(view: MenuViewControllerInput,
         interactor: MenuInteractorInput,
         router: MenuRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: Extension - MenuViewToPresenterProtocol
extension MenuPresenter: MenuViewControllerOutput {
    func viewDidLoad() {
        view?.initialSetup(title: "Главное меню")
    }
}

// MARK: Extension - MenuInteractorToPresenterProtocol
extension MenuPresenter: MenuInteractorOutput {
    
}
