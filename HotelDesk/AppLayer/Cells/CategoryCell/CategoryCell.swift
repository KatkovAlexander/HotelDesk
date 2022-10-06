//
//  CategoryCell.swift
//  HotelDesk
//
//  Created by Александр Катков on 27.09.2022.
//

import Foundation
import UIKit
import SnapKit

class CategoryCell: UICollectionViewCell {
    
    weak var delegate: CategoryCellDelegate?
    
    // MARK: Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        layer.cornerRadius = 10
        
        snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTap() {
        delegate?.didSelectCategory()
    }
    
    func bind(_ category: CategoryCellModel) {
        
    }
}
