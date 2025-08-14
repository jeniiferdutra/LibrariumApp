//
//  DetailCollectionViewViewModel.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 11/07/25.
//

import UIKit

class DetailCollectionViewViewModel {
    public let publishedDate: String
    public let language: String
    public let publisher: String
    public let pageCount: String
    public let isbn: String
    public let printType: String

    init(volumeInfo: VolumeInfo?) {
        self.publishedDate = volumeInfo?.publishedDate ?? "00/00"
        self.language = volumeInfo?.language?.uppercased() ?? "N/A"
        self.publisher = volumeInfo?.publisher ?? "Unknown"
        
        if let pages = volumeInfo?.pageCount {
            self.pageCount = pages == 1 ? "1 page" : "\(pages) pages"
        } else {
            self.pageCount = "Pages: N/A"
        }

        self.isbn = volumeInfo?.industryIdentifiers?.first(where: { $0.type == "ISBN_13" })?.identifier ?? "N/A"
        self.printType = volumeInfo?.printType ?? "Unknown"
    }
}
