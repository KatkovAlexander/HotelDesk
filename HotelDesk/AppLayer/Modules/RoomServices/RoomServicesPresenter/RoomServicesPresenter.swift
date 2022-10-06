//
//  RoomServicesPresenter.swift
//  HotelDesk
//
//  Created by Александр Катков on 07.10.2022.
//  
//

import Foundation

class RoomServicesPresenter {

    // MARK: Dependencies
    
    private weak var view:  RoomServicesViewControllerInput?
    private let interactor: RoomServicesInteractorInput
    private let router: RoomServicesRouterInput
    
    init(view: RoomServicesViewControllerInput,
         interactor: RoomServicesInteractorInput,
         router: RoomServicesRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: Extension - RoomServicesViewToPresenterProtocol

extension RoomServicesPresenter: RoomServicesViewControllerOutput {

    func viewDidLoad() {
        view?.initialState(title: "Обслуживание в номерах")
        
        let model = RoomServicesTableViewCellType.created(.init(servieceIndex: 0, text: Mock.smallString))
        let model2 = RoomServicesTableViewCellType.add
        view?.updateModel(models: [model, model2])
    }
    
    func didTapDeleteCell(servieceIndex: Int) {
        print(#fileID, #function, servieceIndex)
    }
    
    func didTapAddRoomService() {
        print(#fileID, #function)
    }
}

// MARK: Extension - RoomServicesInteractorToPresenterProtocol
extension RoomServicesPresenter: RoomServicesInteractorOutput {
    
}
