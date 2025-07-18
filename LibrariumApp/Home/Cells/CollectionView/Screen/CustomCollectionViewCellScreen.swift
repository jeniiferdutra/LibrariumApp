//
//  CustomCollectionViewCellScreen.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 18/04/25.
//

import UIKit

class CustomCollectionViewCellScreen: UIView {
    
    lazy var imageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var booksImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .appBackGroud
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(imageContainerView)
        imageContainerView.addSubview(booksImageView)
        addSubview(titleLabel)
        addSubview(authorLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            imageContainerView.topAnchor.constraint(equalTo: topAnchor),
            imageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageContainerView.heightAnchor.constraint(equalToConstant: 210),
            
            booksImageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            booksImageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            booksImageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
            booksImageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            authorLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -1)
        ])
    }
    
    func apply(viewModel: CustomCollectionViewViewModel) {
        if let url = viewModel.imageURL {
            booksImageView.af.setImage(withURL: url, placeholderImage: viewModel.fallbackImage)
        } else {
            booksImageView.image = viewModel.fallbackImage
        }
        titleLabel.text = viewModel.title
        authorLabel.text = viewModel.author
    }
    
    // MARK: - Acessibilidade
    public func configureAccessibility(with title: String) {
        booksImageView.isAccessibilityElement = true
        booksImageView.accessibilityLabel = "Capa do livro \(title)"
        booksImageView.accessibilityTraits = .image
    }
}
