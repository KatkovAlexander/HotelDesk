//
//  UITableView+extension.swift
//  HotelDesk
//
//  Created by Александр Катков on 05.10.2022.
//

import Foundation
import UIKit

extension UITableView {
    
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(
                row: self.numberOfRows(inSection:  self.numberOfSections-1) - 1,
                section: self.numberOfSections - 1)
            if self.hasRowAtIndexPath(indexPath) {
                self.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }
        }
    }
    
    func hasRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section) &&  self.numberOfRows(inSection: indexPath.section) > 0
    }
}
