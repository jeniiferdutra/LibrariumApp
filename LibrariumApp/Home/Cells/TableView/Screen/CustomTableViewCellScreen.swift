//
//  CustomTableViewCellScreen.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 17/04/25.
//

import UIKit

class CustomTableViewCellScreen: UIView {
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .appBackGroud
        cv.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        return cv
    }()
    
    public func configProtocolsCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
            collectionView.delegate = delegate
            collectionView.dataSource = dataSource
        }

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
        addSubview(collectionView)
        addSubview(categoryLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                
            collectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
