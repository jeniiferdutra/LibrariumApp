//
//  HeaderTableViewCell.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 09/07/25.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    static let identifier: String = "HeaderTableViewCell"
    private let homeScreen: HeaderTableViewCellScreen = HeaderTableViewCellScreen()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        contentView.addSubview(homeScreen)
        homeScreen.pin(to: contentView)
    }
}
