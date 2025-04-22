//
//  HomeViewModel.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 17/04/25.
//

import UIKit

class HomeViewModel {
    
    private var categories: [BookCategory] = []
        
    init() {
        loadMockData()
    }
    
    private func loadMockData() {
        categories = [
            BookCategory(genre: "Fantasia", books: [
            Books(imageURL: "asa"),
            Books(imageURL: "hobbit"),
            Books(imageURL: "rainha"),
            Books(imageURL: "game"),
            Books(imageURL: "duna"),
            Books(imageURL: "vorazes"),
            Books(imageURL: "principe")
        ]),
            BookCategory(genre: "Romance", books: [
                Books(imageURL: "hoover"),
                Books(imageURL: "john"),
                Books(imageURL: "dia"),
                Books(imageURL: "honra"),
                Books(imageURL: "outlander")
            ]),
            BookCategory(genre: "Terror", books: [
                Books(imageURL: "it"),
                Books(imageURL: "iluminado"),
                Books(imageURL: "paciente"),
                Books(imageURL: "misery"),
                Books(imageURL: "giz")
            ])
        ]
    }
    
    public func numberOfCategories() -> Int {
            return categories.count
        }
    
    func category(at index: Int) -> BookCategory {
        return categories[index]
    }

}
