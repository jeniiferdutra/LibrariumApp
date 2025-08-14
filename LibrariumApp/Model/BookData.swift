//
//  BookData.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 18/04/25.
//

import Foundation

// MARK: - LibrariumBook
struct BookData: Codable {
    var kind: String?
    var totalItems: Int?
    var items: [Item]?
}

// MARK: - Item
struct Item: Codable {
    var kind, id, etag: String?
    var selfLink: String?
    var volumeInfo: VolumeInfo?
    var saleInfo: SaleInfo?
    var accessInfo: AccessInfo?
    var searchInfo: SearchInfo?
}

// MARK: - AccessInfo
struct AccessInfo: Codable {
    var country, viewability: String?
    var embeddable, publicDomain: Bool?
    var textToSpeechPermission: String?
    var epub, pdf: Epub?
    var webReaderLink: String?
    var accessViewStatus: String?
    var quoteSharingAllowed: Bool?
}

// MARK: - Epub
struct Epub: Codable {
    var isAvailable: Bool?
}

// MARK: - SaleInfo
struct SaleInfo: Codable {
    var country, saleability: String?
    var isEbook: Bool?
}

// MARK: - SearchInfo
struct SearchInfo: Codable {
    var textSnippet: String?
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    var title: String?
    var authors: [String]?
    var publisher, publishedDate, description: String?
    var industryIdentifiers: [IndustryIdentifier]?
    var readingModes: ReadingModes?
    var pageCount: Int?
    var printType: String?
    var categories: [String]?
    var maturityRating: String?
    var allowAnonLogging: Bool?
    var contentVersion: String?
    var panelizationSummary: PanelizationSummary?
    var imageLinks: ImageLinks?
    var language: String?
    var previewLink, infoLink: String?
    var canonicalVolumeLink: String?
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    var smallThumbnail, thumbnail: String?
}

// MARK: - IndustryIdentifier
struct IndustryIdentifier: Codable {
    var type, identifier: String?
}

// MARK: - PanelizationSummary
struct PanelizationSummary: Codable {
    var containsEpubBubbles, containsImageBubbles: Bool?
}

// MARK: - ReadingModes
struct ReadingModes: Codable {
    var text, image: Bool?
}
