//
//  CustomCollectionViewCell.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 18/04/25.
//

import UIKit
import AlamofireImage

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
    
    public func setupCell(with viewModel: CustomCollectionViewViewModel) {
        if let url = viewModel.imageURL {
            homeScreen.booksImageView.af.setImage(withURL: url)
        } else {
            homeScreen.booksImageView.image = UIImage(named: "semcapa")
        }
        homeScreen.titleLabel.text = viewModel.title
        homeScreen.authorLabel.text = viewModel.author
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
