//
//  ChatbotViewControllerOutput.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//  
//


import Foundation

protocol ChatbotViewControllerOutput: AnyObject {
    
    func viewDidLoad()
    
    func didTapSend(text: String)
}
