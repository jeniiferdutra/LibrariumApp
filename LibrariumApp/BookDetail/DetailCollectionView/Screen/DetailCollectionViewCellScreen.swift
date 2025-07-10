//
//  DetailCollectionViewCellScreen.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 09/07/25.
//

import UIKit

class DetailCollectionViewCellScreen: UIView {
    
    lazy var publishDateTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Publication date"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    lazy var publishDateImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "calendar")
        return img
    }()
    
    lazy var publishDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        return label
    }()

    lazy var languageTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Language"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    lazy var languageImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "network")
        return img
    }()
    
    lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var publisherTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Publisher"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    lazy var publisherImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "building.2")
        return img
    }()
    
    lazy var publisherLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        return label
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
        addSubview(publishDateTitleLabel)
        addSubview(publishDateImageView)
        addSubview(publishDateLabel)
        addSubview(languageTitleLabel)
        addSubview(languageImageView)
        addSubview(languageLabel)
        addSubview(publisherTitleLabel)
        addSubview(publisherImageView)
        addSubview(publisherLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            publishDateTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            publishDateTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            publishDateImageView.topAnchor.constraint(equalTo: publishDateTitleLabel.bottomAnchor, constant: 5),
            publishDateImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            publishDateLabel.topAnchor.constraint(equalTo: publishDateImageView.bottomAnchor, constant: 5),
            publishDateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            languageTitleLabel.topAnchor.constraint(equalTo: publishDateTitleLabel.topAnchor),
            languageTitleLabel.leadingAnchor.constraint(equalTo: publishDateTitleLabel.trailingAnchor, constant: 30),
            
            languageImageView.topAnchor.constraint(equalTo: languageTitleLabel.bottomAnchor, constant: 5),
            languageImageView.centerXAnchor.constraint(equalTo: languageTitleLabel.centerXAnchor),
            
            languageLabel.topAnchor.constraint(equalTo: languageImageView.bottomAnchor, constant: 5),
            languageLabel.centerXAnchor.constraint(equalTo: languageImageView.centerXAnchor),
            
            publisherTitleLabel.topAnchor.constraint(equalTo: languageTitleLabel.topAnchor),
            publisherTitleLabel.leadingAnchor.constraint(equalTo: languageTitleLabel.trailingAnchor, constant: 30),
            
            publisherImageView.topAnchor.constraint(equalTo: publisherTitleLabel.bottomAnchor, constant: 5),
            publisherImageView.centerXAnchor.constraint(equalTo: publisherTitleLabel.centerXAnchor),
            
            publisherLabel.topAnchor.constraint(equalTo: publisherImageView.bottomAnchor, constant: 5),
            publisherLabel.centerXAnchor.constraint(equalTo: publisherImageView.centerXAnchor),
        ])
    }
}
