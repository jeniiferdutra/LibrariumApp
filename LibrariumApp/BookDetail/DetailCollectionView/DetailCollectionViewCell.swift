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
    
    public func setupData(data: BookDetailData) {
        if let languages = data.languages, let firstLang = languages.first?.key {
            let langCode = firstLang.replacingOccurrences(of: "/languages/", with: "").uppercased()
            homeScreen.languageLabel.text = langCode
        } else {
            homeScreen.languageLabel.text = "N/A"
        }
        homeScreen.publishDateLabel.text = data.firstPublishDate ?? "Desconhecida"
        if let publishers = data.publishers {
            homeScreen.publisherLabel.text = publishers.joined(separator: ", ")
        } else {
            homeScreen.publisherLabel.text = "Desconhecida"
        }    }
    
}
