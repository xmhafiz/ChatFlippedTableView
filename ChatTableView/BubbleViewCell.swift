//
//  BubbleViewCell.swift
//  ChatTableView
//
//  Created by Mohd Hafiz on 02/02/2023.
//

import UIKit

enum BubbleSide {
    case left
    case right
}

class BubbleViewCell: FlippedTableViewCell {
    // MARK: - Properties
    private let minimumEmptySpacing: CGFloat = 56
    private let leftBubbleColor: UIColor = .systemGray6
    private let rightBubbleColor: UIColor = .systemGreen.withAlphaComponent(0.1)

    var bubbleSide: BubbleSide = .left {
        didSet {
            updateSide()
        }
    }
    
    // MARK: - UI
    lazy var containerStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 4
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 8
        return view
    }()

    lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        return view
    }()
    
    lazy var leftSpacer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isHidden = true
        return view
    }()

    lazy var rightSpacer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isHidden = true
        return view
    }()

    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label.withAlphaComponent(0.8)
        label.font = .systemFont(ofSize: 14)
        label.text = "Lorem ipsum"
        label.numberOfLines = 0
        return label
    }()

    lazy var senderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label.withAlphaComponent(0.4)
        label.font = .systemFont(ofSize: 12)
        label.text = "Bob"
        return label
    }()

    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label.withAlphaComponent(0.4)
        label.font = .systemFont(ofSize: 10)
        label.text = "5.03 pm"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        setupView()
        updateSide()
        setupContainer()
    }

    func setupView() {
        self.selectionStyle = .none
        contentView.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            // set the bubble spacer minimum width
            leftSpacer.widthAnchor.constraint(greaterThanOrEqualToConstant: minimumEmptySpacing),
            rightSpacer.widthAnchor.constraint(greaterThanOrEqualToConstant: minimumEmptySpacing),
        ])

        mainStackView.addArrangedSubview(leftSpacer)
        mainStackView.addArrangedSubview(containerStackView)
        mainStackView.addArrangedSubview(rightSpacer)
    }

    func setupContainer() {
        containerStackView.addArrangedSubview(senderLabel)
        containerStackView.addArrangedSubview(messageLabel)
        containerStackView.addArrangedSubview(timeLabel)
    }

    func updateSide() {
        switch bubbleSide {
        case .right:
            containerStackView.backgroundColor = rightBubbleColor
            rightSpacer.isHidden = true
            leftSpacer.isHidden = false
            senderLabel.isHidden = true
        case .left:
            containerStackView.backgroundColor = leftBubbleColor
            rightSpacer.isHidden = false
            leftSpacer.isHidden = true
            senderLabel.isHidden = false
        }
    }
}
