//
//  ChatViewController.swift
//  ChatTableView
//
//  Created by Mohd Hafiz on 02/02/2023.
//

import UIKit

class ChatViewController: UIViewController {
    var messages = SampleData.messages
    
    lazy var tableView: FlippedTableView = {
        let view = FlippedTableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .none
        view.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 24, right: 0)
        view.delegate = self
        view.dataSource = self
        view.rowHeight = UITableView.automaticDimension
        view.register(BubbleViewCell.self, forCellReuseIdentifier: "BubbleViewCell")
        return view
    }()
    
    let textFieldView = TextFieldView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chat"
        setupView()
        setupActions()
    }

    func setupView() {
        view.addSubview(tableView)
        view.addSubview(textFieldView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: textFieldView.topAnchor),
            
            textFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textFieldView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupActions() {
        textFieldView.sendButton.addTarget(self, action: #selector(didClickSendButton), for: .touchUpInside)
    }
    
    @objc func didClickSendButton() {
        let text = textFieldView.textField.text ?? ""
        let message = Message(text: text, time: Date().toTimeString, isSender: true)
        // insert at the beginning of message
        messages.insert(message, at: 0)
        tableView.reloadData()
        textFieldView.textField.text = ""
        mockReply()
    }

    func mockReply() {
        let randomMessage = SampleData.getRandomMessage()
        let message = Message(text: randomMessage, time: Date().toTimeString, senderName: "Fred", isSender: false)
        // send message after 1 second
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            self?.messages.insert(message, at: 0)
            self?.tableView.reloadData()
        }
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BubbleViewCell", for: indexPath) as? BubbleViewCell else {
            return UITableViewCell()
        }
        cell.messageLabel.text = message.text
        cell.senderLabel.text = message.senderName
        cell.timeLabel.text = message.time
        
        if message.isSender {
            cell.bubbleSide = .right
        } else {
            cell.bubbleSide = .left
        }
        return cell
    }
}

extension Date {
    var toTimeString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: self)
    }
}
