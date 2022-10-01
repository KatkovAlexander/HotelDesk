//
//  MenuViewControllerOutput.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//  
//


import Foundation

protocol MenuViewControllerOutput: AnyObject {
    
    var models: [MenuSectionModel] { get }
    
    func viewDidLoad()
}
