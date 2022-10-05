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
    
    func didTapSend(text: String) {
        let output = MessageModel(type: .outbox, message: text)
        view?.updateTable(message: output)
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let input = MessageModel(type: .inbox, message: Mock.smallString)
            self.view?.updateTable(message: input)
        }
    }
}

// MARK: Extension - ChatbotInteractorToPresenterProtocol
extension ChatbotPresenter: ChatbotInteractorOutput {
    
}
