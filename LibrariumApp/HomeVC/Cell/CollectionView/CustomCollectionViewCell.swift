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
    
    public func setupCell(with book: VolumeInfo) {
        if let urlString = book.imageLinks?.thumbnail?
                .replacingOccurrences(of: "http://", with: "https://"),
           let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: encodedString) {
            loadImage(from: url)
        } else {
            self.homeScreen.bookImageView.image = UIImage(systemName: "book.fill")
        }
    }
    
    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil,
                  let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.homeScreen.bookImageView.image = image
            }
        }.resume()
    }
}
