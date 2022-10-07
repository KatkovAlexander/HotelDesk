//
//  CreateRoomServieceCellDelegate.swift
//  HotelDesk
//
//  Created by Александр Катков on 08.10.2022.
//

import Foundation

protocol CreateRoomServieceCellDelegate: AnyObject {
    
    func didTapSelect(title: String, subtitle: String)
    
    func didTapDeleteServieceCell()
    
    func didSelectLabel(type: CreateRoomServieceCellSelectedLabelType)
}
