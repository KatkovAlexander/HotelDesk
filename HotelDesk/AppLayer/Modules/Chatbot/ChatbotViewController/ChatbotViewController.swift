//
//  ChatbotViewController.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//  
//

import UIKit
import RxSwift
import RxKeyboard

class ChatbotViewController: UIViewController {
    
    var output: ChatbotViewControllerOutput!

    // MARK: Outlets
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 44.0
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.separatorStyle = .none
            tableView.dataSource = self
            tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        }
    }
    
    @IBOutlet private weak var messageEntryView: UIView!
    
    @IBOutlet private weak var outboxPlaceHolder: UILabel!
    @IBOutlet private weak var outboxTextView: UITextView! {
        didSet {
            outboxTextView.sizeToFit()
            outboxTextView.delegate = self
        }
    }
    
    @IBOutlet private weak var sendView: UIView! {
        didSet {
            sendView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                 action: #selector(didTapSend)))
        }
    }
    @IBOutlet private weak var sendImageView: UIImageView!
    
    @IBOutlet private weak var messageEntryViewBottomConstraint: NSLayoutConstraint!
    
    // MARK: Private properties
    
    private var messages: [MessageModel] = []
    
    private let bag = DisposeBag()
    
    private lazy var height: CGFloat = defaultHeight + messageEntryViewBottomConstraint.constant
    private var defaultHeight: CGFloat {
        return messageEntryView.frame.maxY
    }

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        observeKeyboard()
        registerCell()
        tableView.scrollToBottom()
        output.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        sendView.layer.cornerRadius = sendView.frame.height / 2
    }
    
    private func observeKeyboard() {
        RxKeyboard
            .instance
            .visibleHeight
            .skip(1)
            .drive(onNext: { [weak self] (height) in
                guard let self = self else {
                    return
                }
                
                let margin: CGFloat = height == 0 ? 0 : 85
                self.messageEntryViewBottomConstraint.constant = height - margin
                self.view.layoutIfNeeded()
                self.tableView.scrollToBottom()
                self.height = height
            })
            .disposed(by: bag)
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: String(describing: ChatInboxCell.self), bundle: nil),
                           forCellReuseIdentifier: String(describing: ChatInboxCell.self))
        tableView.register(UINib(nibName: String(describing: ChatOutboxCell.self), bundle: nil),
                           forCellReuseIdentifier: String(describing: ChatOutboxCell.self))
    }
    
    // MARK: Action
    
    @objc private func didTapSend() {
        output.didTapSend(text: outboxTextView.text)
        outboxTextView.text =  ""
        
        sendView.backgroundColor = Colors.Light.ui
        sendImageView.tintColor = Colors.Dark.ui
        sendView.isUserInteractionEnabled = false
    }
}

// MARK: Extension - ChatbotPresenterToViewProtocol

extension ChatbotViewController: ChatbotViewControllerInput {
    
    func initialSetup(title: String) {
        navigationItem.title = title
    }
    
    func updateTable(message: MessageModel) {
        messages.append(message)
        
        DispatchQueue.main.async { self.tableView.reloadData() }
        tableView.scrollToBottom()
    }
}


extension ChatbotViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        switch message.type {
        case .inbox:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChatInboxCell.self), for: indexPath) as? ChatInboxCell else {
                return UITableViewCell(style: .default, reuseIdentifier: nil)
            }

            cell.bind(textInbox: message.message)
            return cell
        case .outbox:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChatOutboxCell.self), for: indexPath) as? ChatOutboxCell else {
                return UITableViewCell(style: .default, reuseIdentifier: nil)
            }

            cell.bind(textOutbox: message.message)
            return cell
        }
    }
}

extension ChatbotViewController: UITextViewDelegate {
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        outboxPlaceHolder.isHidden = true
        
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        if textView.text.count == 0 {
            outboxPlaceHolder.isHidden = false
        }
        
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count == 0 {
            sendView.backgroundColor = Colors.Light.ui
            sendImageView.tintColor = Colors.Dark.ui
            sendView.isUserInteractionEnabled = false
        } else {
            sendView.backgroundColor = Colors.Dark.ui
            sendImageView.tintColor = Colors.Light.ui
            sendView.isUserInteractionEnabled = true
        }
    }
}
