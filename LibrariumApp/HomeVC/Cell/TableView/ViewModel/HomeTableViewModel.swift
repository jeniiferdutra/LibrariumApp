//
//  HomeTableViewModel.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 19/04/25.
//

import UIKit

class HomeTableViewModel {

    private var book: Books

        init(book: Books) {
            self.book = book
        }

        var imageURL: String {
            return book.imageURL
        }
}
