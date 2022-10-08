//
//  AlarmPresenter.swift
//  HotelDesk
//
//  Created by Александр Катков on 08.10.2022.
//  
//

import Foundation

class AlarmPresenter {

    // MARK: Dependencies
    
    private weak var view:  AlarmViewControllerInput?
    private let interactor: AlarmInteractorInput
    private let router: AlarmRouterInput
    
    init(view: AlarmViewControllerInput,
         interactor: AlarmInteractorInput,
         router: AlarmRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: Extension - AlarmViewToPresenterProtocol
extension AlarmPresenter: AlarmViewControllerOutput {
    func viewDidLoad() {
    
    }
}

// MARK: Extension - AlarmInteractorToPresenterProtocol
extension AlarmPresenter: AlarmInteractorOutput {
    
}
