//
//  BookDetailScreen.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 10/05/25.
//

import UIKit

class BookDetailScreen: UIView {

    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo2")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        imageView.isAccessibilityElement = true
        imageView.accessibilityLabel = "Librarium App"
        imageView.accessibilityTraits = .staticText
        return imageView
    }()
    
    lazy var coverImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 5
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        return label
    }()
    
    lazy var authorsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        return label
    }()
    
    lazy var publisherLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        return label
    }()
    
    lazy var publishedDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        return label
    }()
    
    lazy var pageCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sinopse"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textAlignment = .left
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        return label
    }()
    
    lazy var descriptionTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        addViews()
        configConstraints()
    }
    
    private func addViews() {
        addSubview(logoImageView)
        addSubview(coverImageView)
        addSubview(titleLabel)
        addSubview(authorsLabel)
        addSubview(publisherLabel)
        addSubview(publishedDateLabel)
        addSubview(pageCountLabel)
        addSubview(descriptionLabel)
        addSubview(descriptionTextLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 115),
            logoImageView.widthAnchor.constraint(equalToConstant: 260),
            
            coverImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
            coverImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            coverImageView.heightAnchor.constraint(equalToConstant: 230),
            coverImageView.widthAnchor.constraint(equalToConstant: 150),
            
            titleLabel.topAnchor.constraint(equalTo: coverImageView.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            authorsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            authorsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authorsLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            publisherLabel.topAnchor.constraint(equalTo: authorsLabel.bottomAnchor, constant: 3),
            publisherLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            publisherLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            publishedDateLabel.topAnchor.constraint(equalTo: publisherLabel.bottomAnchor, constant: 3),
            publishedDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            publishedDateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            pageCountLabel.topAnchor.constraint(equalTo: publishedDateLabel.bottomAnchor, constant: 3),
            pageCountLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            pageCountLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 17),
            descriptionLabel.leadingAnchor.constraint(equalTo: coverImageView.leadingAnchor),
            
            descriptionTextLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: coverImageView.leadingAnchor),
            descriptionTextLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        
        ])
    }
    
}
