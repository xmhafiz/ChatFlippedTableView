//
//  ChatViewController.swift
//  ChatTableView
//
//  Created by Mohd Hafiz on 02/02/2023.
//

import UIKit

class ChatViewController: UIViewController {
    let messages = SampleData.messages
    
    lazy var tableView: FlippedTableView = {
        let view = FlippedTableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .none
        view.delegate = self
        view.dataSource = self
        view.rowHeight = UITableView.automaticDimension
        view.register(RightBubbleViewCell.self, forCellReuseIdentifier: "RightBubbleViewCell")
        view.register(LeftBubbleViewCell.self, forCellReuseIdentifier: "LeftBubbleViewCell")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        if message.isSender {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RightBubbleViewCell", for: indexPath) as? RightBubbleViewCell else {
                return UITableViewCell()
            }
            cell.messageLabel.text = message.text
            cell.timeLabel.text = message.time
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LeftBubbleViewCell", for: indexPath) as? LeftBubbleViewCell else {
                return UITableViewCell()
            }
            cell.senderLabel.text = message.senderName
            cell.messageLabel.text = message.text
            cell.timeLabel.text = message.time
            return cell
        }
    }
}
