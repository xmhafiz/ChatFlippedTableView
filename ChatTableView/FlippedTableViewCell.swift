//
//  FlippedTableViewCell.swift
//  ChatTableView
//
//  Created by Mohd Hafiz on 02/02/2023.
//

import UIKit

class FlippedTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupFlip()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFlip()
    }
    
    private func setupFlip() {
        // flip cell vertically
        self.transform = .init(scaleX: 1, y: -1)
    }
}
