//
//  RoomServiecePickerConfigurator.swift
//  HotelDesk
//
//  Created by Александр Катков on 08.10.2022.
//  
//

import UIKit
import PanModal

protocol RoomServiecePickerDelegate: AnyObject {
    
    func selectedCell(text: String, type: CreateRoomServieceCellSelectedLabelType)
}

final class RoomServiecePickerConfigurator {
    
    func configure(type: CreateRoomServieceCellSelectedLabelType, delegate: RoomServiecePickerDelegate?) -> UIViewController & PanModalPresentable {
        guard let viewController = UIStoryboard(name: String(describing: RoomServiecePickerViewController.self), bundle: nil).instantiateInitialViewController() as? RoomServiecePickerViewController else {
            fatalError("Can't load RoomServiecePickerViewController from storyboard")
        }
        
        viewController.type = type
        viewController.delegate = delegate
        
        return viewController
    }
}
