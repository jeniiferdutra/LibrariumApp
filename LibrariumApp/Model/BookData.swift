//
//  Books.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 18/04/25.
//

import Foundation

struct BookData: Codable {
    var key, name, subjectType: String?
    var workCount: Int?
    var works: [Book]?

    enum CodingKeys: String, CodingKey {
        case key, name
        case subjectType = "subject_type"
        case workCount = "work_count"
        case works
    }
}

struct Book: Codable {
    let key: String?
    let title: String?
    let coverId: Int?
    let authors: [Author]?

    enum CodingKeys: String, CodingKey {
        case key, title
        case coverId = "cover_id"
        case authors
    }
}

struct Author: Codable {
    let name: String?
}
