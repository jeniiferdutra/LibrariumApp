////
////  DetailCollectionViewCell.swift
////  LibrariumApp
////
////  Created by Jenifer Rocha on 09/07/25.
////
//
//import UIKit
//
//class DetailCollectionViewCell: UICollectionViewCell {
//    
//    static let identifier: String = "DetailCollectionViewCell"
//    
//    private let homeScreen: DetailCollectionViewCellScreen = DetailCollectionViewCellScreen()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        configScreen()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func configScreen() {
//        contentView.addSubview(homeScreen)
//        homeScreen.pin(to: contentView)
//    }
//    
//    public func setupData(data: BookDetailData, editionData: EditionDetailData?) {
//        // Data da publicação
//        homeScreen.publishDateLabel.text = data.firstPublishDate ?? "00/00"
//        
//        // Idioma
//        if let langKey = editionData?.languages?.first?.key {
//            let langCode = langKey.replacingOccurrences(of: "/languages/", with: "").uppercased()
//            homeScreen.languageLabel.text = langCode
//        } else {
//            homeScreen.languageLabel.text = "N/A"
//        }
//        
//        // Editora
//        if let publishers = editionData?.publishers {
//            homeScreen.publisherLabel.text = publishers.joined(separator: ", ")
//        } else {
//            homeScreen.publisherLabel.text = "Unknown"
//        }
//        
//        // Número de páginas
//        if let pages = editionData?.numberOfPages {
//            homeScreen.pagesLabel.text = "\(pages) pages"
//        } else {
//            homeScreen.pagesLabel.text = "Pages: N/A"
//        }
//    }
//}
