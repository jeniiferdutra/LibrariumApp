//
//  CustomCollectionViewCell.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 18/04/25.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CustomCollectionViewCell"
    
    private let homeScreen: CustomCollectionViewCellScreen = CustomCollectionViewCellScreen()
    
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
    
    public func setupCell(with book: Book) {
        if let coverId = book.coverId {
            let urlString = "https://covers.openlibrary.org/b/id/\(coverId)-M.jpg"
            if let url = URL(string: urlString) {
                loadImage(from: url)
            }
        } else {
            self.homeScreen.booksImageView.image = UIImage(named: "semcapa")
        }
        homeScreen.titleLabel.text = book.title ?? "Titulo desconhecido"
        if let authors = book.authors, !authors.isEmpty {
            let names = authors.compactMap { $0.name }.joined(separator: ", ")
            homeScreen.authorLabel.text = names
        } else {
            homeScreen.authorLabel.text = "Autor desconhecido"
        }
    }
    
    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil,
                  let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.homeScreen.booksImageView.image = image
            }
        }.resume()
    }
}
