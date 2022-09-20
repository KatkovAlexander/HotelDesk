//
//  ChatbotPresenter.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//  
//

import Foundation

class ChatbotPresenter {

    // MARK: Dependencies
    
    private weak var view:  ChatbotViewControllerInput?
    private let interactor: ChatbotInteractorInput
    private let router: ChatbotRouterInput
    
    init(view: ChatbotViewControllerInput,
         interactor: ChatbotInteractorInput,
         router: ChatbotRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: Extension - ChatbotViewToPresenterProtocol
extension ChatbotPresenter: ChatbotViewControllerOutput {
    func viewDidLoad() {
        view?.initialSetup(title: "Чат бот")
    }
}

// MARK: Extension - ChatbotInteractorToPresenterProtocol
extension ChatbotPresenter: ChatbotInteractorOutput {
    
}
