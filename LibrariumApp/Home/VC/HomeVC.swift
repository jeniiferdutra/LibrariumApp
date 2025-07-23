//
//  HomeVC.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 16/04/25.
//

import UIKit

class HomeVC: UIViewController {
    
    private var homeScreen: HomeScreen?
    private var viewModel: HomeViewModel = HomeViewModel()
    private var isSearching = false
    private var searchResults: [Item] = []
    
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
        homeScreen?.delegate(delegate: self)
        viewModel.fetchRequest()
        homeScreen?.tableView.estimatedRowHeight = 420
        homeScreen?.tableView.rowHeight = UITableView.automaticDimension
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

extension HomeVC: HomeViewModelProtocol {
    func success() {
        DispatchQueue.main.async {
            self.homeScreen?.configTableView(delegate: self, dataSource: self)
            self.homeScreen?.tableView.reloadData()
        }
    }
    
    func error(message: String) {
        print(#function)
        //MARK: Criar um Alert
    }
    
}

extension HomeVC: HomeScreenProtocol {
    func tappedLogoutButton() {
        dismiss(animated: true)
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return 1
        } else {
            return viewModel.numberOfSections + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isSearching {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
                return UITableViewCell()
            }
            cell.setupCell(categoryName: "Result", books: searchResults)
            cell.delegate = self
            return cell
        } else {
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier, for: indexPath) as? HeaderTableViewCell else {
                    return UITableViewCell()
                }
                return cell
            }
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
                return UITableViewCell()
            }
            
            let index = indexPath.row - 1
            let category = viewModel.getCategoryName(at: index)
            let books = viewModel.getBooksForCategory(at: index)
            cell.setupCell(categoryName: category, books: books)
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 && !isSearching ? 250 : 348
    }
}

extension HomeVC: CustomTableViewCellDelegate {
    func didSelectBook(_ book: Item) {
        guard let id = book.id else { return }
        let viewModel = BookDetailViewModel(volumeId: id)
        let detailVC = BookDetailVC(viewModel: viewModel)
        present(detailVC, animated: true)
    }
}

extension HomeVC: UISearchBarDelegate {
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
                }
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
