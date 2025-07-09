//
//  HeaderTableViewCellScreen.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 09/07/25.
//

import UIKit

class HeaderTableViewCellScreen: UIView {

    lazy var bookImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "books")
        return img
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(bookImageView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            bookImageView.topAnchor.constraint(equalTo: topAnchor),
            bookImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bookImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bookImageView.heightAnchor.constraint(equalToConstant: 250),
        ])
    }
}
