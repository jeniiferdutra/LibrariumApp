//
//  HomeViewController.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 16/04/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var homeScreen: HomeScreen?
    private var viewModel: HomeViewModel = HomeViewModel()
    private var isSearching = false
    private var searchResults: [Item] = []
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
        viewModel.delegate(delegate: self)
        viewModel.fetchRequest(.request)
        homeScreen?.configSearchBarDelegate(delegate: self)
        homeScreen?.delegate(delegate: self)
        homeScreen?.tableView.estimatedRowHeight = 420
        homeScreen?.tableView.rowHeight = UITableView.automaticDimension
    }
    
}

extension HomeViewController: HomeViewModelProtocol {
    func success() {
        DispatchQueue.main.async {
            self.homeScreen?.configTableView(delegate: self, dataSource: self)
            self.homeScreen?.tableView.reloadData()
        }
    }
    
    func error(message: String) {
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
}

extension HomeViewController: HomeScreenProtocol {
    func tappedLogoutButton() {
        viewModel.logout { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    let loginVC = LoginVC()
                    let nav = UINavigationController(rootViewController: loginVC)
                    if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let window = scene.windows.first {
                        window.rootViewController = nav
                        window.makeKeyAndVisible()
                    }
                }
            case .failure(let error):
                print(#function)
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return 1
        } else {
            return viewModel.numberOfSections + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isSearching {
            return configureCustomCell(for: tableView, at: indexPath, isSearch: true)
        } else {
            if indexPath.row == 0 {
                return configureHeaderCell(for: tableView, at: indexPath)
            }
            return configureCustomCell(for: tableView, at: indexPath, isSearch: false)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 && !isSearching ? 250 : 348
    }
}

extension HomeViewController: CustomTableViewCellDelegate {
    func didSelectBook(_ book: Item) {
        guard let id = book.id else { return }
        let viewModel = BookDetailViewModel(volumeId: id)
        let detailVC = BookDetailVC(viewModel: viewModel)
        present(detailVC, animated: true)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            searchResults.removeAll()
            homeScreen?.tableView.reloadData()
        } else {
            isSearching = true
            viewModel.searchBooks(with: searchText) { results in
                DispatchQueue.main.async {
                    self.searchResults = results
                    self.homeScreen?.tableView.reloadData()
                    if results.isEmpty {
                        Alert(controller: self).showAlertInformation(
                            title: "No results",
                            message: "We couldn't find any books for \"\(searchText)\"."
                        )
                    }
                }
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

// MARK: - Private Helpers

private extension HomeViewController {
    
    func configureHeaderCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: HeaderTableViewCell.identifier,
            for: indexPath
        ) as? HeaderTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func configureCustomCell(for tableView: UITableView, at indexPath: IndexPath, isSearch: Bool) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomTableViewCell.identifier,
            for: indexPath
        ) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        if isSearch {
            cell.setupCell(categoryName: "Result", books: searchResults)
        } else {
            let index = indexPath.row - 1
            let category = viewModel.getCategoryName(at: index)
            let books = viewModel.getBooksForCategory(at: index)
            cell.setupCell(categoryName: category, books: books)
        }
        
        cell.delegate = self
        return cell
    }
}
