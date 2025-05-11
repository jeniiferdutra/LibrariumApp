//
//  HomeViewModel.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 17/04/25.
//

import UIKit

protocol HomeViewModelProtocol: AnyObject {
    func success()
    func error()
}

class HomeViewModel {
    
    private var service: BookService = BookService()
    private var categories: [String] = []
    private var booksByCategory: [String: [VolumeInfo]] = [:]
    private var searchBookData: BookData?
    public var isSearching: Bool = false
    private var filteredBooks: [VolumeInfo] = []
    
    private weak var delegate: HomeViewModelProtocol?
    
    public func delegate(delegate: HomeViewModelProtocol?) {
        self.delegate = delegate
    }
    
    public var heightForRowAt: CGFloat {
        return 290
    }
    
    init() {
        fetchCategories() // Carregar as categorias ao inicializar
    }
    
    private func fetchCategories() {
        let categoryUrls = [
            "horror",
            "romance",
            "fantasy",
            "adventure",
            "Juvenile Fiction",
            "mystery",
            "Comics & Graphic Novels",
            //"Science",
        ]
        
        // Grupo para esperar todas as requisições assíncronas
        let group = DispatchGroup()
        var fetchedCategories: [String] = [] // Guardar as categorias que foram carregadas
        
        for url in categoryUrls {
            group.enter()
            service.getBooksByCategory(category: url) { bookData, error in
                let category = url.capitalized  // "Romance", "Horror", etc.
                if self.booksByCategory[category] == nil {
                    self.booksByCategory[category] = []
                }
                if let books = bookData?.items?.compactMap({ $0.volumeInfo }) {
                    self.booksByCategory[category]?.append(contentsOf: books)
                }
                if !fetchedCategories.contains(category) {
                    fetchedCategories.append(category)
                }
                group.leave()
            }
        }
        
        // Quando todas as requisições terminarem, atualizar o modelo de dados e a UI
        group.notify(queue: .main) {
            // Remover duplicatas, caso existam, e atribuir às categorias
            self.categories = Array(Set(fetchedCategories))
            self.delegate?.success() // Chama o sucesso quando os dados estiverem prontos
        }
    }
    
    public func numberOfCategories() -> Int {
        return isSearching ? 1 : categories.count
    }
    
    func category(at index: Int) -> String {
        return isSearching ? "Resultado da Busca" : categories[index]
    }
    
    public func numberOfItemsInSection(for category: String) -> [VolumeInfo] { // acessar os livros por categoria
        return booksByCategory[category] ?? []
    }
    
    public var sizeForItemAt: CGSize {
            return CGSize(width: 150, height: 230)
        }
    
    public func filterSearchText(_ text: String) {
        if text.isEmpty {
            isSearching = false
            filteredBooks = []
        } else {
            isSearching = true
            filteredBooks = booksByCategory
                .flatMap { $0.value } // junta todos os livros de todas as categorias
                .filter { $0.title?.lowercased().contains(text.lowercased()) ?? false }
        }
    }
    
    public func numberOfFilteredBooks() -> Int {
        return filteredBooks.count
    }
    
    public func filteredBook(at index: Int) -> VolumeInfo {
        return filteredBooks[index]
    }
    
    public func books(for category: String) -> [VolumeInfo] {
        return booksByCategory[category] ?? []
    }
}





