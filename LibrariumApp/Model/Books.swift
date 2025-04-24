//
//  Books.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 18/04/25.
//

import UIKit

struct Books: Codable {
    var imageURL: String?
}

struct BookCategory: Codable {
    var genre: String?
    var books: [Books]?
}
