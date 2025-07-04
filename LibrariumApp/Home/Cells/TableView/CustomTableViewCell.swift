//
//  CustomTableViewCell.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 17/04/25.
//

import UIKit

protocol CustomTableViewCellDelegate: AnyObject {
    func didTapBook(_ volumeInfo: VolumeInfo)
}

class CustomTableViewCell: UITableViewCell {
    
    weak var delegate: CustomTableViewCellDelegate?
    
    static let identifier: String = "CustomTableViewCell"
    
    private var viewModel: HomeViewModel?
    private var categoryName: String?
    private var books: [VolumeInfo] = []
    
    private let homeScreen: CustomTableViewCellScreen = CustomTableViewCellScreen()
    
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
    
    // Configura a célula com os dados da categoria
    public func setupCell(viewModel: HomeViewModel, categoryName: String, with books: [VolumeInfo]) {
        self.viewModel = viewModel
        self.categoryName = categoryName
        self.books = books
        homeScreen.categoryLabel.text = categoryName
        homeScreen.categoryLabel.accessibilityLabel = "Categoria: \(categoryName)"
        homeScreen.collectionView.reloadData()
    }
    
}


extension CustomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let category = categoryName else { return 0 }
        let books = viewModel?.numberOfItemsInSection(for: category) ?? []
        return books.count // Contando os itens da lista de livros
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell,
              let category = categoryName else {
            return UICollectionViewCell()
        }
        
        // Acessando os livros da categoria
        let books = viewModel?.numberOfItemsInSection(for: category) ?? []
        
        // Garantir que o livro existe na posição
        let book = books[indexPath.row]
        
        // Configurar a célula com o livro
        cell.setupCell(with: book) // Passa apenas o livro aqui, sem a categoria
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel?.sizeForItemAt ?? CGSize(width: 150, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedBook = books[indexPath.row]
            delegate?.didTapBook(selectedBook)
    }
}
