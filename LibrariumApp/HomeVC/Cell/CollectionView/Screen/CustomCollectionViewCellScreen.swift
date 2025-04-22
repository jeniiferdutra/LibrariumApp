//
//  CustomCollectionViewCellScreen.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 18/04/25.
//

import UIKit

class CustomCollectionViewCellScreen: UIView {
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var bookImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 5
        return img
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .appBackGroud
        addSubview(cardView)
        cardView.addSubview(bookImageView)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            cardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            cardView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            bookImageView.topAnchor.constraint(equalTo: cardView.topAnchor),
            bookImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            bookImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            bookImageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor)
        ])
    }
}
