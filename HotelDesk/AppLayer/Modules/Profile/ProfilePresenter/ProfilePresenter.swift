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
    
    func buildModels() {
        var models: [ProfileTableViewCellType] = []
        models.append(ProfileTableViewCellType.profileCell("1"))
        models.append(ProfileTableViewCellType.oneLineCell(.favorite))
        models.append(ProfileTableViewCellType.oneLineCell(.availableAlarms))
        models.append(ProfileTableViewCellType.oneLineCell(.serviceHistory))
        models.append(ProfileTableViewCellType.oneLineCell(.orderFoodHistory))
        models.append(ProfileTableViewCellType.oneLineCell(.buyHistory))
        view?.updateModel(models: models)
    }
}

// MARK: Extension - ProfileViewToPresenterProtocol
extension ProfilePresenter: ProfileViewControllerOutput {
    
    func viewDidLoad() {
        view?.initialSetup(title: "Профиль")
        
        buildModels()
    }
    
    func didSelectCell(type: OneLineWithChevronCellType) {
        print(#fileID, #function)
    }
}

// MARK: Extension - ProfileInteractorToPresenterProtocol
extension ProfilePresenter: ProfileInteractorOutput {
    
}
