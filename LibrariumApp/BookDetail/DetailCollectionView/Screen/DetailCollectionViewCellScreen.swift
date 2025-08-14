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
        img.tintColor = .black
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
        img.tintColor = .black
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
        img.tintColor = .black
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
    
    lazy var pagesTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Number of pages"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    lazy var pagesImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "book.pages")
        img.tintColor = .black
        return img
    }()
    
    lazy var pagesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var isbnIdentifierTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ISBN"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    lazy var isbnIdentifierImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "barcode.viewfinder")
        img.tintColor = .black
        return img
    }()
    
    lazy var isbnIdentifierLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var printTypeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Print type"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    lazy var printTypeImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "books.vertical")
        img.tintColor = .black
        return img
    }()
    
    lazy var printTypeLabel: UILabel = {
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
        addSubview(publisherTitleLabel)
        addSubview(publisherImageView)
        addSubview(publisherLabel)
        addSubview(languageTitleLabel)
        addSubview(languageImageView)
        addSubview(languageLabel)
        addSubview(publishDateTitleLabel)//publishDateTitleLabel
        addSubview(publishDateImageView)
        addSubview(publishDateLabel)
        addSubview(pagesTitleLabel)
        addSubview(pagesImageView)
        addSubview(pagesLabel)
        addSubview(isbnIdentifierTitleLabel)
        addSubview(isbnIdentifierImageView)
        addSubview(isbnIdentifierLabel)
        addSubview(printTypeTitleLabel)
        addSubview(printTypeImageView)
        addSubview(printTypeLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            publisherTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            publisherTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),

            publisherImageView.topAnchor.constraint(equalTo: publisherTitleLabel.bottomAnchor, constant: 5),
            publisherImageView.centerXAnchor.constraint(equalTo: publisherTitleLabel.centerXAnchor),

            publisherLabel.topAnchor.constraint(equalTo: publisherImageView.bottomAnchor, constant: 5),
            publisherLabel.centerXAnchor.constraint(equalTo: publisherImageView.centerXAnchor),
            publisherLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 80),

            publishDateTitleLabel.topAnchor.constraint(equalTo: publisherTitleLabel.topAnchor),
            publishDateTitleLabel.leadingAnchor.constraint(equalTo: publisherTitleLabel.trailingAnchor, constant: 30),

            publishDateImageView.topAnchor.constraint(equalTo: publishDateTitleLabel.bottomAnchor, constant: 5),
            publishDateImageView.centerXAnchor.constraint(equalTo: publishDateTitleLabel.centerXAnchor),

            publishDateLabel.topAnchor.constraint(equalTo: publishDateImageView.bottomAnchor, constant: 5),
            publishDateLabel.centerXAnchor.constraint(equalTo: publishDateImageView.centerXAnchor),
            publishDateLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 110),

            languageTitleLabel.topAnchor.constraint(equalTo: publishDateTitleLabel.topAnchor),
            languageTitleLabel.leadingAnchor.constraint(equalTo: publishDateTitleLabel.trailingAnchor, constant: 30),

            languageImageView.topAnchor.constraint(equalTo: languageTitleLabel.bottomAnchor, constant: 5),
            languageImageView.centerXAnchor.constraint(equalTo: languageTitleLabel.centerXAnchor),

            languageLabel.topAnchor.constraint(equalTo: languageImageView.bottomAnchor, constant: 5),
            languageLabel.centerXAnchor.constraint(equalTo: languageImageView.centerXAnchor),
            languageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 110),

            pagesTitleLabel.topAnchor.constraint(equalTo: languageTitleLabel.topAnchor),
            pagesTitleLabel.leadingAnchor.constraint(equalTo: languageTitleLabel.trailingAnchor, constant: 30),

            pagesImageView.topAnchor.constraint(equalTo: pagesTitleLabel.bottomAnchor, constant: 5),
            pagesImageView.centerXAnchor.constraint(equalTo: pagesTitleLabel.centerXAnchor),

            pagesLabel.topAnchor.constraint(equalTo: pagesImageView.bottomAnchor, constant: 5),
            pagesLabel.centerXAnchor.constraint(equalTo: pagesImageView.centerXAnchor),
            pagesLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 110),

            isbnIdentifierTitleLabel.topAnchor.constraint(equalTo: pagesTitleLabel.topAnchor),
            isbnIdentifierTitleLabel.leadingAnchor.constraint(equalTo: pagesTitleLabel.trailingAnchor, constant: 45),

            isbnIdentifierImageView.topAnchor.constraint(equalTo: isbnIdentifierTitleLabel.bottomAnchor, constant: 5),
            isbnIdentifierImageView.centerXAnchor.constraint(equalTo: isbnIdentifierTitleLabel.centerXAnchor),

            isbnIdentifierLabel.topAnchor.constraint(equalTo: isbnIdentifierImageView.bottomAnchor, constant: 5),
            isbnIdentifierLabel.centerXAnchor.constraint(equalTo: isbnIdentifierImageView.centerXAnchor),
            isbnIdentifierLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 115),

            printTypeTitleLabel.topAnchor.constraint(equalTo: isbnIdentifierTitleLabel.topAnchor),
            printTypeTitleLabel.leadingAnchor.constraint(equalTo: isbnIdentifierTitleLabel.trailingAnchor, constant: 45),

            printTypeImageView.topAnchor.constraint(equalTo: printTypeTitleLabel.bottomAnchor, constant: 5),
            printTypeImageView.centerXAnchor.constraint(equalTo: printTypeTitleLabel.centerXAnchor),

            printTypeLabel.topAnchor.constraint(equalTo: printTypeImageView.bottomAnchor, constant: 5),
            printTypeLabel.centerXAnchor.constraint(equalTo: printTypeImageView.centerXAnchor),
            printTypeLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 110)
        ])
    }
}
