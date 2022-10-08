//
//  OneLineWithChevronCellDelegate.swift
//  HotelDesk
//
//  Created by Александр Катков on 09.10.2022.
//

import Foundation

protocol OneLineWithChevronCellDelegate: AnyObject {
    
    func didSelectCell(type: OneLineWithChevronCellType)
}
