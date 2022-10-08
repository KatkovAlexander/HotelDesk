//
//  AlarmViewController.swift
//  HotelDesk
//
//  Created by Александр Катков on 08.10.2022.
//  
//

import UIKit
import PanModal
import SnapKit

class AlarmViewController: UIViewController {
    
    var output: AlarmViewControllerOutput!

    // MARK: Outlets
    
    @IBOutlet weak var datePicker: UIDatePicker! {
        didSet {
            datePicker.minimumDate = Date()
        }
    }
    
    @IBOutlet private weak var segmentView: UIView!
    @IBOutlet private weak var acceptView: DesignableView! {
        didSet {
            acceptView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                   action: #selector(didTap)))
        }
    }
    
    // MARK: Private properties
    
    fileprivate let segmentControll: SegmentControl = {
        let view = SegmentControl.createFromNib()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        output.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        segmentControll.setNeedsLayout()
    }
    
    private func setupUI() {
        segmentView.addSubview(segmentControll)
        segmentControll.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        segmentControll.addSegments(["Позвонить", "Оффлайн"])
    }
    
    // MARK: Action
    
    @objc private func didTap() {
        dismiss(animated: true)
    }
    
}

// MARK: Extension - AlarmPresenterToViewProtocol 
extension AlarmViewController: AlarmViewControllerInput {
    
}

extension AlarmViewController: PanModalPresentable {
    
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(500)
    }
    
    var longFormHeight: PanModalHeight {
        return .contentHeight(500)
    }
    
    var shouldRoundTopCorners: Bool {
        return true
    }
    
    var showDragIndicator: Bool {
        return true
    }
    
    var allowsTapToDismiss: Bool {
        return true
    }
    
    var allowsDragToDismiss: Bool {
        return true
    }
    
    func shouldRespond(to panModalGestureRecognizer: UIPanGestureRecognizer) -> Bool {
        return true
    }
}
