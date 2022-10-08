//
//  StoriesCell.swift
//  HotelDesk
//
//  Created by Александр Катков on 25.09.2022.
//

import Foundation
import UIKit

class StoryCell: UICollectionViewCell {
        
    // MARK: Outlets
    
    @IBOutlet private weak var storyImageView: UIImageView!
    
    // MARK: Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        
    }
    
    func bind(_ story: StoryCellModel) {
        storyImageView.image = UIImage(named: story.image)
    }
}
