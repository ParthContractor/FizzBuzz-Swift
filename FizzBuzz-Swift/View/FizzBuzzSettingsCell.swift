//
//  FizzBuzzSettingsCell.swift
//  FizzBuzz-Swift
//
//  Created by Parth on 26/01/20.
//  Copyright © 2020 Parth. All rights reserved.
//

import UIKit

class FizzBuzzSettingsCell: UITableViewCell {
    static let cellIdentifier = "FizzBuzzSettingsCellIdentifier"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .detailButton
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
