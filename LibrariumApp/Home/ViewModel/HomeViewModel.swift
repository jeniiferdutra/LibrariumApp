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
    
    // MARK: - Private Properties
    private var service: BookService = BookService()
    private var booksByCategory: [String: [Item]] = [:]
    private var searchResults: [Item] = []
    private let categories = [
        "romance", "fantasy", "horror", "science_fiction", "history",
        "biography", "children", "young_adult", "mystery", "thriller",
        "adventure", "classics", "comics", "poetry", "art",
        "music", "philosophy", "religion", "science", "technology",
        "travel", "cookbooks", "self_help", "health", "sports"
    ]
    
    private weak var delegate: HomeViewModelProtocol?
    
    // MARK: - Public Methods
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
    
    public func searchBooks(with query: String, completion: @escaping ([Item]) -> Void) {
        service.searchBooks(with: query) { [weak self] result in
            switch result {
            case .success(let books):
                let items = books.items ?? []
                self?.searchResults = items
                completion(items)
            case .failure(let error):
                print("Erro na busca: \(error.localizedDescription)")
                completion([])
            }
        }
        
    }
    
    public func getSearchResults() -> [Item] {
        return searchResults
    }
    
    public var numberOfSections: Int {
        return categories.count
    }
    
    public func getCategoryName(at index: Int) -> String {
        return categories[index]
    }
    
    public func getBooksForCategory(at index: Int) -> [Item] {
        let category = categories[index]
        return booksByCategory[category] ?? []
    }
}





