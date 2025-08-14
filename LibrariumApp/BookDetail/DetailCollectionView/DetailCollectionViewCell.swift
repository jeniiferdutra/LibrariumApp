//
//  DetailCollectionViewCell.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 09/07/25.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "DetailCollectionViewCell"
    
    private let homeScreen: DetailCollectionViewCellScreen = DetailCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        contentView.addSubview(homeScreen)
        homeScreen.pin(to: contentView)
    }
    
    public func setupData(with viewModel: DetailCollectionViewViewModel) {
        homeScreen.publishDateLabel.text = viewModel.publishedDate
        homeScreen.languageLabel.text = viewModel.language
        homeScreen.publisherLabel.text = viewModel.publisher
        homeScreen.pagesLabel.text = viewModel.pageCount
        homeScreen.isbnIdentifierLabel.text = viewModel.isbn
        homeScreen.printTypeLabel.text = viewModel.printType
    }
}
