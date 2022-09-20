//
//  TabBarObjects.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//

import Foundation
import UIKit

enum TabBarItemType: Int, CaseIterable {
    
    case menu
    case chatbot
    case profile
}

struct TabBarModule {
    
    private let type: TabBarItemType
    
    init(type: TabBarItemType){
        self.type = type
    }
    
    func configure() -> UIViewController {
        switch type {
        case .menu:
            return MenuConfigurator().configure()
        case .chatbot:
            return ChatbotConfigurator().configure()
        case .profile:
            return ProfileConfigurator().configure()
        }
    }
}

struct TabBarPresentation {
    
    private let type: TabBarItemType
    
    init(type: TabBarItemType){
        self.type = type
    }
    
    var title: String {
        switch type {
        case .menu:
            return "Главное меню"
        case .chatbot:
            return "Чат бот"
        case .profile:
            return "Профиль"
        }
    }
    
    var image: UIImage? {
        switch type {
        case .menu:
            return UIImage(systemName: "menucard")
        case .chatbot:
            return UIImage(systemName: "message")
        case .profile:
            return UIImage(systemName: "person")
        }
    }
    
    var selectedImage: UIImage? {
        switch type {
        case .menu:
            return UIImage(systemName: "menucard.fill")
        case .chatbot:
            return UIImage(systemName: "message.fill")
        case .profile:
            return UIImage(systemName: "person.fill")
        }
    }
}
