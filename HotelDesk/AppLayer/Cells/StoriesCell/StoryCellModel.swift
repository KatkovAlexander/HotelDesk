//
//  StoriesCellModel.swift
//  HotelDesk
//
//  Created by Александр Катков on 25.09.2022.
//

struct StoryCellModel: Hashable, Equatable {
    
    let image: String
    
    var hashValue: Int {
        var hasher = Hasher()
        hasher.combine(image)
        return hasher.finalize()
    }
    
    static func == (lhs: StoryCellModel, rhs: StoryCellModel) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}
