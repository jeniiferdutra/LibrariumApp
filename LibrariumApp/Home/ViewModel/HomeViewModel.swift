//
//  HomeViewModel.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 17/04/25.
//

import UIKit

protocol HomeViewModelProtocol: AnyObject {
    func success()
    func error(message: String)
}

class HomeViewModel {
    
    private var service: BookService = BookService()
    private var books: [BookData] = []
    private var booksByCategory: [String: [Item]] = [:]
    private let categories = [
        "romance",
        "fantasy",
        "horror",
        "science_fiction",
        "history",
        "biography",
        "children",
        "young_adult",
        "mystery",
        "thriller",
        "adventure",
        "classics",
        "comics",
        "poetry",
        "art",
        "music",
        "philosophy",
        "religion",
        "science",
        "technology",
        "travel",
        "cookbooks",
        "self_help",
        "health",
        "sports"
    ]
    
    private weak var delegate: HomeViewModelProtocol?
    
    public func delegate(delegate: HomeViewModelProtocol?) {
        self.delegate = delegate
    }
    
    public func fetchRequest() {
        let group = DispatchGroup()
        var errorOccurred = false
        
        for category in categories {
            group.enter()
            service.fetchBooksByCategory(for: category) { result in
                switch result {
                case .success(let librariumBook):
                    let items = librariumBook.items ?? []
                    self.booksByCategory[category] = items
                case .failure(let error):
                    print("Erro ao buscar \(category): \(error.localizedDescription)")
                    errorOccurred = true
                }
                group.leave()
            }
        }
        
        group.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            if errorOccurred {
                self.delegate?.error(message: "Erro ao buscar algumas categorias.")
            } else {
                self.delegate?.success()
            }
        }
    }
    
    public var numberOfSections: Int {
        return categories.count
    }
    
    public func loadCurrentCategory(indexPath: IndexPath) -> Item? {
        let category = categories[indexPath.section]
        return booksByCategory[category]?[indexPath.row]
    }
    
    public func getCategoryName(at index: Int) -> String {
        return categories[index]
    }

    public func getBooksForCategory(at index: Int) -> [Item] {
        let category = categories[index]
        return booksByCategory[category] ?? []
    }
}





