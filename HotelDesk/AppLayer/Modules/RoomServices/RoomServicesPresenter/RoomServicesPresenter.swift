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
    
    private var didServiceAdding = false
    private var selectedCategory: String?
    private var selectedSubcategory: String?
    private var servieceIdGenerator: Int = 0
    
    init(view: RoomServicesViewControllerInput,
         interactor: RoomServicesInteractorInput,
         router: RoomServicesRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func buildModels() {
        var models: [RoomServicesTableViewCellType] = []
        
        for service in interactor.services {
            let serviceModel = RoomServicesTableViewCellType.created(.init(serviceId: service.serviceId,
                                                                           titleText: service.titleText,
                                                                           subtitleText: service.subtitleText))
            models.append(serviceModel)
        }
        
        if didServiceAdding {
            let createModel = RoomServicesTableViewCellType.create(.init(categoryText: selectedCategory,
                                                                         subcategoryText: selectedSubcategory))
            models.append(createModel)
        } else {
            let addModel = RoomServicesTableViewCellType.add
            models.append(addModel)
        }
        
        view?.updateModel(models: models)
        view?.isMakeOrderButtonAvailable(available: interactor.services.count > 0)
    }
}

// MARK: Extension - RoomServicesViewToPresenterProtocol

extension RoomServicesPresenter: RoomServicesViewControllerOutput {

    func viewDidLoad() {
        view?.initialState(title: "Обслуживание в номерах")
        
        buildModels()
    }
    
    func didTapMakeOrder() {
        router.close()
    }
    
    func didTapDeleteCreatedServiceCell(serviceId: Int) {
        interactor.deleteService(serviceId: serviceId)
    }
    
    func didTapAddRoomService() {
        didServiceAdding = true
        buildModels()
    }
    
    func didTapSelect(title: String, subtitle: String) {
        didServiceAdding = false
        selectedCategory = nil
        selectedSubcategory = nil
        interactor.addToServices(service: .init(serviceId: servieceIdGenerator,
                                                 titleText: title,
                                                 subtitleText: subtitle))
        servieceIdGenerator += 1
    }
    
    func didTapDeleteServieceCell() {
        didServiceAdding = false
        selectedCategory = nil
        selectedSubcategory = nil
        buildModels()
    }
    
    func didSelectLabel(type: CreateRoomServiceCellSelectedLabelType) {
        router.openModal(type: type, delegate: self, selectedCategory: selectedCategory)
    }
}

// MARK: Extension - RoomServicesInteractorToPresenterProtocol

extension RoomServicesPresenter: RoomServicesInteractorOutput {

    func servicesUpdated() {
        buildModels()
    }
}

extension RoomServicesPresenter: RoomServicePickerDelegate {
    
    func selectedCell(text: String, type: CreateRoomServiceCellSelectedLabelType) {
        switch type {
        case .category:
            selectedCategory = text
            selectedSubcategory = nil
        case .subcategory:
            selectedSubcategory = text
        }
        
        buildModels()
    }
}
