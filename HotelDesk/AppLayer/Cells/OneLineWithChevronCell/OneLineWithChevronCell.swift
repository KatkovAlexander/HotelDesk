//
//  OneLineWithChevronCell.swift
//  HotelDesk
//
//  Created by Александр Катков on 09.10.2022.
//

import Foundation
import UIKit

class OneLineWithChevronCell: UITableViewCell {
    
    private var type: OneLineWithChevronCellType?
    weak var delegate: OneLineWithChevronCellDelegate?
    
    // MARK: Outlets
    
    @IBOutlet private weak var containerView: DesignableView! {
        didSet {
            containerView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                      action: #selector(didTap)))
        }
    }
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: Action
    
    @objc private func didTap() {
        guard let type = type else {
            return
        }
        
        delegate?.didSelectCell(type: type)
    }
    
    // MARK: Public func
    
    func bind(type: OneLineWithChevronCellType) {
        titleLabel.text = type.rawValue
    }
}
