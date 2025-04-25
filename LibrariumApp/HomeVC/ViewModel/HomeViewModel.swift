//
//  HomeViewModel.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 17/04/25.
//

import UIKit

class HomeViewModel {
    
    private var service: BookService = BookService()
    private var categories: [BookCategory] = []
        
    init() {
        loadMockData()
    }
    
    private func loadMockData() {
        categories = [BookCategory]()
    }
    
    public func numberOfCategories() -> Int {
            return categories.count
        }
    
    func category(at index: Int) -> BookCategory {
        return categories[index]
    }
    
    public func fetchAllRequest() {
        service.getBookDataJson { bookData, error in
            if error == nil { // se nao existe erro
                self.categories = bookData?.categories ?? [] 
            }
        }
    }

}
