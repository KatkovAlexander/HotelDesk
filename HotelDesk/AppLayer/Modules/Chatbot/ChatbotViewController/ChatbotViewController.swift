//
//  ChatbotViewController.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//  
//

import UIKit

class ChatbotViewController: UIViewController {
    
    var output: ChatbotViewControllerOutput!

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewDidLoad()
    }
    
}

// MARK: Extension - ChatbotPresenterToViewProtocol 
extension ChatbotViewController: ChatbotViewControllerInput {
    
    func initialSetup(title: String) {
        navigationItem.title = title
    }
}
