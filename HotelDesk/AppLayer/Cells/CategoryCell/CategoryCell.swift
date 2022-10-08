//
//  CategoryCell.swift
//  HotelDesk
//
//  Created by Александр Катков on 27.09.2022.
//

import Foundation
import UIKit

class CategoryCell: UICollectionViewCell {
    
    weak var delegate: CategoryCellDelegate?
    
    private var type: CategoryCellType?
    
    // MARK: Outlets
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var frontImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
    }
    
    
    @objc private func didTap() {
        guard let type = type else {
            return
        }
        
        delegate?.didSelectCategory(type: type)
    }
    
    func bind(_ category: CategoryCellModel) {
        self.type = category.type
        titleLabel.text = category.type.rawValue
        
        switch category.type {
        case .restaurant:
            backgroundImageView.image = UIImage(named: "restBack")
            frontImageView.image = UIImage(systemName: "book")
        case .roomService:
            backgroundImageView.image = UIImage(named: "serviceBack")
            frontImageView.image = UIImage(systemName: "house")
        case .alarm:
            backgroundImageView.image = UIImage(named: "alarmBack")
            frontImageView.image = UIImage(systemName: "alarm")
        case .mossArt:
            backgroundImageView.image = UIImage(named: "mossArtBack")
            frontImageView.image = UIImage(systemName: "paintbrush.pointed")
        case .additional:
            backgroundImageView.image = UIImage(named: "additionalBack")
            frontImageView.image = UIImage(systemName: "plus.circle")
        case .shop:
            backgroundImageView.image = UIImage(named: "shopBack")
            frontImageView.image = UIImage(systemName: "bag")
        }
    }
}
