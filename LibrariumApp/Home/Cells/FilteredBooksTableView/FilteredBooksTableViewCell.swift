//
//  FilteredBooksTableViewCell.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 16/07/25.
//

import UIKit

class FilteredBooksTableViewCell: UITableViewCell {

    static let identifier: String = "FilteredBooksTableViewCell"
    
    private let homeScreen: FilteredBooksTableViewCellScreen = FilteredBooksTableViewCellScreen()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
