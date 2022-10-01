//
//  MenuCollectionViewModel.swift
//  HotelDesk
//
//  Created by Александр Катков on 27.09.2022.
//

import Foundation

enum MenuCollectionViewType {
    
    case storyCell
    
    case categoryCell
}

struct MenuSectionModel: Hashable {
    
    let type: MenuCollectionViewType
    let items: [AnyHashable]
    
    var hashValue: Int {
        var hasher = Hasher()
        hasher.combine(type)
        hasher.combine(items.count)
        return hasher.finalize()
    }
    
    static func == (lhs: MenuSectionModel, rhs: MenuSectionModel) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}
