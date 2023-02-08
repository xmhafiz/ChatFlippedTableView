//
//  TextFieldView.swift
//  ChatTableView
//
//  Created by Mohd Hafiz on 02/02/2023.
//

import UIKit

class TextFieldView: UIView {
    lazy var textField: UITextField = {
        let view = UITextField()
        view.placeholder = "Enter message .."
        return view
    }()
    
    lazy var containerStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 16
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()

    lazy var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send", for: .normal)
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentCompressionResistancePriority(.required, for: .horizontal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        self.backgroundColor = .systemGray.withAlphaComponent(0.1)
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerStackView)
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            containerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
        containerStackView.addArrangedSubview(textField)
        containerStackView.addArrangedSubview(sendButton)
    }
}
