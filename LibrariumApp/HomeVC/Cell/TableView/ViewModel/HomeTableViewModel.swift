//
//  HomeTableViewModel.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 19/04/25.
//

import UIKit

class HomeTableViewModel {

    private var books = [
        Books(imageURL: "outlander"),
        Books(imageURL: "codigo"),
        Books(imageURL: "game"),
        Books(imageURL: "iluminado"),
        Books(imageURL: "anjos")
    ]
        
    public var getListBooks: [Books] {
        return books
    }

    public var numberOfRows: Int {
        return books.count
    }

}
