//
//  HomeVC.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 16/04/25.
//

import UIKit

class HomeVC: UIViewController, CustomTableViewCellDelegate {

    private var homeScreen: HomeScreen?
    private var viewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        homeScreen?.configSearchBarDelegate(delegate: self)
    }
    
}

extension HomeVC: HomeViewModelProtocol {
    func success() {
        DispatchQueue.main.async {// Executa o código dentro do closure na thread principal
            self.homeScreen?.configTableView(delegate: self, dataSource: self)// Atualiza a interface de usuário configurando a TableView
            self.homeScreen?.tableView.reloadData()
        }
    }
    
    func error() {
        print(#function)
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.isSearching {
            return viewModel.numberOfFilteredBooks()
        } else {
            return viewModel.numberOfCategories()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.isSearching {
            // Exibir livros filtrados como uma lista simples
            let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleBookCell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "SimpleBookCell")

            // Obtenha o livro filtrado
            let book = viewModel.filteredBook(at: indexPath.row)
            cell.textLabel?.text = book.title
            cell.detailTextLabel?.text = book.authors?.joined(separator: ", ")
            if let imageUrlString = book.imageLinks?.thumbnail?.replacingOccurrences(of: "http://", with: "https://"),
               let url = URL(string: imageUrlString) {
                
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url),
                       let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            cell.imageView?.image = image
                            cell.imageView?.contentMode = .scaleAspectFit
                            cell.imageView?.clipsToBounds = true
                            cell.setNeedsLayout()
                        }
                    }
                }
            }
            return cell
        } else {
            // Exibir livros por categoria
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
            let category = viewModel.category(at: indexPath.row)
            let books = viewModel.books(for: category)
            
            // Passando os livros para a célula
            cell?.setupCell(viewModel: viewModel, categoryName: category, with: books)
            cell?.delegate = self
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.isSearching ? 230 : viewModel.heightForRowAt
    }
    
    func didTapBook(_ volumeInfo: VolumeInfo) {
        let detailVC = BookDetailVC(info: volumeInfo)
        present(detailVC, animated: true)
    }
    
}

extension HomeVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterSearchText(searchText)
        viewModel.isSearching = !searchText.isEmpty
        homeScreen?.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
