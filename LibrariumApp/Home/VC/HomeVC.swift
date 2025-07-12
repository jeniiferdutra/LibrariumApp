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
        viewModel.fetchRequest()
        homeScreen?.tableView.estimatedRowHeight = 420
        homeScreen?.tableView.rowHeight = UITableView.automaticDimension
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

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfSections + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier, for: indexPath) as? HeaderTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
                return UITableViewCell()
            }
            let index = indexPath.row - 1
            let category = viewModel.getCategoryName(at: index)
            let books = viewModel.getBooksForCategory(at: index)
            cell.delegate = self
            cell.setupCell(categoryName: category, books: books)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 250
        }
        return 348
    }
}

extension HomeVC: CustomTableViewCellDelegate {
    func didSelectBook(_ book: Item) {
        guard let key = book.id else { return }
        let viewModel = BookDetailViewModel(volumeId: key)
        let detailVC = BookDetailVC(viewModel: viewModel)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        homeScreen?.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
