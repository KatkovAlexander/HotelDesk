//
//  CategoryCellModel.swift
//  HotelDesk
//
//  Created by Александр Катков on 27.09.2022.
//

import Foundation

enum CategoryCellType: String {
    
    case restaurant = "Ресторан SOUL"
    
    case roomService = "Обслуживание в номерах"
    
    case alarm = "Будильник"
    
    case mossArt = "Moss Art"
    
    case shop = "Zelinskiy & Rozen Shop"
    
    case additional = "Дополнительные услуги"
}

struct CategoryCellModel: Hashable, Equatable {
    
    let type: CategoryCellType
    
    var hashValue: Int {
        var hasher = Hasher()
        hasher.combine(type)
        return hasher.finalize()
    }
    
    static func == (lhs: CategoryCellModel, rhs: CategoryCellModel) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}
