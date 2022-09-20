//
//  ProfilePresenter.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//  
//

import Foundation

class ProfilePresenter {

    // MARK: Dependencies
    
    private weak var view:  ProfileViewControllerInput?
    private let interactor: ProfileInteractorInput
    private let router: ProfileRouterInput
    
    init(view: ProfileViewControllerInput,
         interactor: ProfileInteractorInput,
         router: ProfileRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: Extension - ProfileViewToPresenterProtocol
extension ProfilePresenter: ProfileViewControllerOutput {
    func viewDidLoad() {
        view?.initialSetup(title: "Профиль")
    }
}

// MARK: Extension - ProfileInteractorToPresenterProtocol
extension ProfilePresenter: ProfileInteractorOutput {
    
}
