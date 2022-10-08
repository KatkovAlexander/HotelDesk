//
//  RoomServiecePickerConfigurator.swift
//  HotelDesk
//
//  Created by Александр Катков on 08.10.2022.
//  
//

import UIKit
import PanModal

protocol RoomServicePickerDelegate: AnyObject {
    
    func selectedCell(text: String, type: CreateRoomServiceCellSelectedLabelType)
}

final class RoomServicePickerConfigurator {
    
    func configure(type: CreateRoomServiceCellSelectedLabelType, delegate: RoomServicePickerDelegate?, selectedCategory: String?) -> UIViewController & PanModalPresentable {
        guard let viewController = UIStoryboard(name: String(describing: RoomServicePickerViewController.self), bundle: nil).instantiateInitialViewController() as? RoomServicePickerViewController else {
            fatalError("Can't load RoomServiecePickerViewController from storyboard")
        }
        
        viewController.type = type
        viewController.delegate = delegate
        viewController.selectedCategory = selectedCategory
        
        return viewController
    }
}
