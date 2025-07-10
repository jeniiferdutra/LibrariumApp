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
        return viewModel.numberOfRowsInSection + 1
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
            let data = viewModel.loadCurrentCategory(indexPath: IndexPath(row: indexPath.row - 1, section: indexPath.section))
            cell.setupCell(data: data)
            cell.delegate = self
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
    func didSelectBook(_ book: Book) {
        guard let key = book.key else { return }
        
        BookDetailService().fetchBookDetail(for: key) { result in
            switch result {
            case .success(let detailData):
                DispatchQueue.main.async {
                    let viewModel = BookDetailViewModel(book: book)
                    let detailVC = BookDetailVC(viewModel: viewModel)
                    self.navigationController?.pushViewController(detailVC, animated: true)
                }
            case .failure(let error):
                print("Erro ao buscar detalhes: \(error.localizedDescription)")
            }
        }
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
