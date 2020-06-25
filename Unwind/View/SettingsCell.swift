//
//  SettingsCell.swift
//  Unwind
//
//  Created by Alan Cao on 6/25/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemIndigo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
