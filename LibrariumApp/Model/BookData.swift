//
//  BookData.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 24/04/25.
//

import UIKit

struct BookData: Codable { // MARK: O objeto tem que estar em conformidade com o protocol para fazer a decodificaçao
    var categories: [BookCategory]?
}


