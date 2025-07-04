//
//  Books.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 18/04/25.
//

import UIKit

import Foundation

// MARK: - Books
struct BookData: Codable {
    var kind: String?
    var totalItems: Int?
    var items: [Item]?
}

// MARK: - Item
struct Item: Codable {
    var kind: Kind?
    var id, etag: String?
    var selfLink: String?
    var volumeInfo: VolumeInfo?
    var saleInfo: SaleInfo?
    var accessInfo: AccessInfo?
}

// MARK: - AccessInfo
struct AccessInfo: Codable {
    var country: Country?
    var viewability: Viewability?
    var embeddable, publicDomain: Bool?
    var textToSpeechPermission: TextToSpeechPermission?
    var epub, pdf: Epub?
    var webReaderLink: String?
    var accessViewStatus: AccessViewStatus?
    var quoteSharingAllowed: Bool?
}

enum AccessViewStatus: String, Codable {
    case none = "NONE"
    case sample = "SAMPLE"
}

enum Country: String, Codable {
    case br = "BR"
}

// MARK: - Epub
struct Epub: Codable {
    var isAvailable: Bool?
    var acsTokenLink: String?
}

enum TextToSpeechPermission: String, Codable {
    case allowed = "ALLOWED"
    case allowedForAccessibility = "ALLOWED_FOR_ACCESSIBILITY"
}

enum Viewability: String, Codable {
    case noPages = "NO_PAGES"
    case partial = "PARTIAL"
}

enum Kind: String, Codable {
    case booksVolume = "books#volume"
}

// MARK: - SaleInfo
struct SaleInfo: Codable {
    var country: Country?
    var saleability: Saleability?
    var isEbook: Bool?
}

enum Saleability: String, Codable {
    case notForSale = "NOT_FOR_SALE"
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    var title: String?
    var authors: [String]?
    var publishedDate, description: String?
    var industryIdentifiers: [IndustryIdentifier]?
    var readingModes: ReadingModes?
    var pageCount: Int?
    var printType: PrintType?
    var categories: [String]?
    var maturityRating: MaturityRating?
    var allowAnonLogging: Bool?
    var contentVersion: String?
    var panelizationSummary: PanelizationSummary?
    var imageLinks: ImageLinks?
    var language: Language?
    var previewLink, infoLink: String?
    var canonicalVolumeLink: String?
    var publisher: String?
    var averageRating: Double?
    var ratingsCount: Int?
    var subtitle: String?
    var comicsContent: Bool?
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    var smallThumbnail, thumbnail: String?
}

// MARK: - IndustryIdentifier
struct IndustryIdentifier: Codable {
    var type: TypeEnum?
    var identifier: String?
}

enum TypeEnum: String, Codable {
    case isbn10 = "ISBN_10"
    case isbn13 = "ISBN_13"
    case other = "OTHER"
}

enum Language: String, Codable {
    case en = "en"
}

enum MaturityRating: String, Codable {
    case notMature = "NOT_MATURE"
}

// MARK: - PanelizationSummary
struct PanelizationSummary: Codable {
    var containsEpubBubbles, containsImageBubbles: Bool?
    var imageBubbleVersion: String?
}

enum PrintType: String, Codable {
    case book = "BOOK"
}

// MARK: - ReadingModes
struct ReadingModes: Codable {
    var text, image: Bool?
}

