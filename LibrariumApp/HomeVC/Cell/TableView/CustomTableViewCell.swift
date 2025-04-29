//
//  CustomTableViewCell.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 17/04/25.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier: String = "CustomTableViewCell"
    private var viewModel: HomeTableViewModel?
    private var category: BookCategory?

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
    public func setupCell(with category: BookCategory) {
        self.category = category
        homeScreen.categoryLabel.text = category.genre
        // Configura o VoiceOver para ler a categoria corretamente
        homeScreen.categoryLabel.accessibilityLabel = "Categoria: \(category.genre ?? "Desconhecida")"
        homeScreen.collectionView.reloadData()
    }
    
    // A célula agora usa a ViewModel para configurar os livros
        private func setupBookCell(with book: Books) {
            self.viewModel = HomeTableViewModel(book: book)
        }

}


extension CustomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category?.books?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell,
              let category = category else {
            return UICollectionViewCell()
        }

        let book = category.books?[indexPath.row]
        
        // Configura o viewModel com os dados do livro
        setupBookCell(with: book ?? Books(imageURL: "", title: "")) // Passa o objeto Books

        // Configura a célula com o livro e o nome da categoria
        cell.setupCell(book: book ?? Books(imageURL: "", title: ""), categoryName: category.genre ?? "")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 230) 
    }
    
}
