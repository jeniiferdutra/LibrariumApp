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
        var tempBooks: [BookData] = []
        var errorOccurred = false
        
        for category in categories {
            group.enter()
            service.fetchBooks(for: category) { result in
                switch result {
                case .success(let bookData):
                    tempBooks.append(bookData)
                case .failure(let error):
                    print("Erro ao buscar \(category): \(error.localizedDescription)")
                    errorOccurred = true
                }
                group.leave()
            }
        }
        
        group.notify(queue: .main) { [weak self] in
            guard let self else { return }
            self.books = tempBooks
            if errorOccurred {
                self.delegate?.error(message: "Erro ao buscar algumas categorias.")
            } else {
                self.delegate?.success()
            }
        }
    }
    
    public var numberOfRowsInSection: Int {
        return books.count
    }
    
    public func loadCurrentBooks(indexPath: IndexPath) -> BookData {
        return books[indexPath.row]
    }
}





