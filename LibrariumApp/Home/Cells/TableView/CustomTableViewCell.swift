//
//  CustomTableViewCell.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 17/04/25.
//

import UIKit

protocol CustomTableViewCellDelegate: AnyObject {
    func didSelectBook(_ book: Item)
}

class CustomTableViewCell: UITableViewCell {
    
    public weak var delegate: CustomTableViewCellDelegate?

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let book = books[indexPath.row]
        delegate?.didSelectBook(book)
    }
        
    static let identifier: String = "CustomTableViewCell"
    
    private let homeScreen: CustomTableViewCellScreen = CustomTableViewCellScreen()
    private var books: [Item] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configScreen()
        homeScreen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        contentView.addSubview(homeScreen)
        homeScreen.pin(to: contentView)
    }
    
    public func setupCell(categoryName: String, books: [Item]) {
        homeScreen.categoryLabel.text = categoryName.capitalizingFirstLetter()
        self.books = books 
        homeScreen.collectionView.reloadData()
    }
    
}


extension CustomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }

        let book = books[indexPath.row]
        cell.setupCell(with: book)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 290)
    }
}
