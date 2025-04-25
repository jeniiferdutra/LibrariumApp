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
    private var categories: [BookCategory] = []
    
    private weak var delegate: HomeViewModelProtocol?
    
    public func delegate(delegate: HomeViewModelProtocol?) {
        self.delegate = delegate
    }
        
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
        service.getBookDataURLSession { bookData, error in
            if error == nil { // se nao existe erro
                self.categories = bookData?.categories ?? []
                self.delegate?.success()
            } else {
                self.delegate?.error()
            }
        }
    }

}
