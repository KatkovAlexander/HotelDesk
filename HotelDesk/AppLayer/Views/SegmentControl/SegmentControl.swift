//
//  SegmentControl.swift
//  Nalavashe
//
//  Created by Alexander on 08.10.2022.
//

import UIKit

// MARK: SGLSegmentControlDelegate

protocol SegmentControlDelegate: AnyObject {
    
    func onSegmentControl(_ index: Int)
    func onSegmentControl(_ index: Int, control: SegmentControl)
}

extension SegmentControlDelegate {
   
    func onSegmentControl(_ index: Int) { }
    func onSegmentControl(_ index: Int, control: SegmentControl) { }
}

class SegmentControl: UIView, NibLoadable {
    
    // MARK: Open properties
    
    weak var delegate: SegmentControlDelegate?
    
    var selectedIndex: Int = 0 {
        didSet {
            layoutSegmentSlidingView(animate: true)
            
            guard oldValue != selectedIndex else {
                return
            }
        }
    }
    
    // MARK: Outlets
    @IBOutlet weak var segmentsStackView: UIStackView!
    @IBOutlet weak var slidingSegmentView: DesignableView! {
        didSet {
            slidingSegmentView.isHidden = true
        }
    }
    
    // MARK: Private properties
    
    private var segmentButtons: [UIButton] = [] {
        didSet {
            for segment in segmentsStackView.subviews {
                segmentsStackView.removeArrangedSubview(segment)
                segment.removeFromSuperview()
            }
            
            for segment in segmentButtons {
                segmentsStackView.addArrangedSubview(segment)
            }
            
            layoutSegmentSlidingView(animate: false)
            slidingSegmentView.isHidden = false
        }
    }
    
    // MARK: Action
    
    @objc private func onSegment(_ sender: UIButton) {
        let newSelectedIndex = sender.tag
        selectedIndex = newSelectedIndex
        
        delegate?.onSegmentControl(selectedIndex)
        delegate?.onSegmentControl(selectedIndex, control: self)
    }
    
    // MARK: Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutSegmentSlidingView(animate: false)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

// MARK: Open methods

extension SegmentControl {
    
    func addSegment(_ title: String) {
        let segmentButton = UIButton(frame: .zero)
        
        segmentButton.isUserInteractionEnabled = true
        segmentButton.addTarget(self, action: #selector(onSegment(_:)), for: .touchUpInside)
        
        segmentButton.setTitle(title, for: .normal)
        segmentButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        segmentButton.setTitleColor(Colors.Dark.ui, for: .normal)
        
        segmentButton.tag = segmentButtons.count
        
        segmentButtons.append(segmentButton)
    }
    
    func addSegments(_ titles: [String]) {
        selectedIndex = 0
        segmentButtons = []
        
        for title in titles {
            addSegment(title)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
// MARK: Private methods

extension SegmentControl {
    
    private func layoutSegmentSlidingView(animate: Bool) {
        guard !segmentButtons.isEmpty else {
            self.slidingSegmentView.frame = self.segmentsStackView.frame
            return
        }
        
        setNeedsLayout()
        layoutIfNeeded()
        
        let animations = {
            let segment = self.segmentButtons[self.selectedIndex]
            if segment.frame.isEmpty {
                let size = CGSize(width: self.segmentsStackView.bounds.width / CGFloat(self.segmentButtons.count),
                                  height: self.segmentsStackView.bounds.height)
                let point = CGPoint(x: self.segmentsStackView.bounds.minX,
                                    y: self.segmentsStackView.bounds.minY)
                self.slidingSegmentView.frame = CGRect(origin: point, size: size)
            } else {
                self.slidingSegmentView.frame = segment.frame
            }
        }
        
        UIView.animate(withDuration: animate ? 0.35 : 0,
                       delay: 0,
                       animations: animations,
                       completion: nil)
    }
}
