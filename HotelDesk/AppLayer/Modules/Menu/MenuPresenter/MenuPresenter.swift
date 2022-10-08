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
    
    var models: [MenuSectionModel] = []
}

// MARK: extension - MenuViewToPresenterProtocol

extension MenuPresenter: MenuViewControllerOutput {
    
    func viewDidLoad() {
        view?.initialSetup(title: "Главное меню")
        
        var sections: [MenuSectionModel] = []
        
        let itemsInStories = [StoryCellModel(text: "1",
                                             image: "1"),
                              StoryCellModel(text: "2",
                                             image: "2"),
                              StoryCellModel(text: "3",
                                             image: "3"),
                              StoryCellModel(text: "4",
                                             image: "4"),]
        sections.append(.init(type: .storyCell,
                              items: itemsInStories))
        let itemsInCategory = [CategoryCellModel(type: .restaurant),
                               CategoryCellModel(type: .roomService),
                               CategoryCellModel(type: .alarm),
                               CategoryCellModel(type: .mossArt),
                               CategoryCellModel(type: .shop),
                               CategoryCellModel(type: .additional)]
        sections.append(.init(type: .categoryCell,
                              items: itemsInCategory as [AnyHashable]))
        view?.updateCollection(sections: sections)
        
    }
}

// MARK: extension - MenuInteractorToPresenterProtocol

extension MenuPresenter: MenuInteractorOutput {
    
}

// MARK: extension - CategoryCellDelegate

extension MenuPresenter: CategoryCellDelegate {
    
    func didSelectCategory(type: CategoryCellType) {
        switch type {
        case .roomService:
            router.openRoomServices()
        case .alarm:
            router.openAlarm()
        default:
            return
        }
    }
}
