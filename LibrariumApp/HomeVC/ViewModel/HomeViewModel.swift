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
        return categories.count
    }
    
    func category(at index: Int) -> String {
        return categories[index]
    }
    
    public func numberOfItemsInSection(for category: String) -> [VolumeInfo] { // acessar os livros por categoria
        return booksByCategory[category] ?? []
    }
    
    public var sizeForItemAt: CGSize {
        return CGSize(width: 150, height: 230)
    }
}

