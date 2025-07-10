//
//  BookDetailScreen.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 10/05/25.
//

import UIKit

class BookDetailScreen: UIView {
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        label.numberOfLines = 0
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        return label
    }()
    
    lazy var authorsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.lineBreakMode = .byTruncatingTail
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .red
        cv.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
        return cv
    }()
    
    public func configProtocolsCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
            collectionView.delegate = delegate
            collectionView.dataSource = dataSource
    }
    
    lazy var summaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Summary"
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    lazy var summaryTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .appBackGroud
        addViews()
        configConstraints()
    }
    
    private func addViews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(coverImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorsLabel)
        contentView.addSubview(collectionView)
        contentView.addSubview(summaryLabel)
        contentView.addSubview(summaryTextLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            coverImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            coverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            coverImageView.heightAnchor.constraint(equalToConstant: 230),
            coverImageView.widthAnchor.constraint(equalToConstant: 150),
            
            titleLabel.centerYAnchor.constraint(equalTo: coverImageView.centerYAnchor, constant: -12),
            titleLabel.leadingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            authorsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            authorsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authorsLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: coverImageView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            
            summaryLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 15),
            summaryLabel.leadingAnchor.constraint(equalTo: coverImageView.leadingAnchor),
            
            summaryTextLabel.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor, constant: 15),
            summaryTextLabel.leadingAnchor.constraint(equalTo: summaryLabel.leadingAnchor),
            summaryTextLabel.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            
            // 👇 Importante sempre alterar quando adicionar um novo elemento
            summaryTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
            
        ])
    }
    
}
