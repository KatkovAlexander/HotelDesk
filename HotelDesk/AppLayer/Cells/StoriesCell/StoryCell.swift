//
//  StoriesCell.swift
//  HotelDesk
//
//  Created by Александр Катков on 25.09.2022.
//

import Foundation
import UIKit
import SnapKit

class StoryCell: UICollectionViewCell {
        
    // MARK: Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.Dark.ui
        layer.cornerRadius = 10
        
        snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ story: StoryCellModel) {
        
    }
}
