//
//  BookDetailData.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 09/07/25.
//

import Foundation

// MARK: - BookDetailData
struct BookDetailData: Codable {
    var key: String?
    var title: String?
    var description: DescriptionType?
    var firstPublishDate: String?
    var subjects: [String]?
    var covers: [Int]?
    var languages: [Language]?
    
    var publishers: [String]?           // <--- editora
    var numberOfPages: Int?   

    enum CodingKeys: String, CodingKey {
        case key, title, description, subjects, covers, languages
        case firstPublishDate = "first_publish_date"
    }
}

struct DescriptionType: Codable {
    var value: String?
}

struct Language: Codable {
    var key: String?
}
