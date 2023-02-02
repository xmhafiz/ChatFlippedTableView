//
//  FlippedTableView.swift
//  ChatTableView
//
//  Created by Mohd Hafiz on 02/02/2023.
//

import UIKit

class FlippedTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        // flip table view vertically
        self.transform = .init(scaleX: 1, y: -1)
    }
}
