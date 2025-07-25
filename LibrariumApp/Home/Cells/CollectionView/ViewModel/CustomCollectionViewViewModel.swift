//
//  CustomCollectionViewViewModel.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 16/07/25.
//

import UIKit

class CustomCollectionViewViewModel {

    // public - podem ser públicos, pois a View precisa exibir isso
    public let imageURL: URL?
    public let title: String
    public let author: String
    let fallbackImage = UIImage(named: "semcapa") ?? UIImage()
    
    init(volumeInfo: VolumeInfo?) {
        if let urlString = volumeInfo?.imageLinks?.thumbnail?.replacingOccurrences(of: "http://", with: "https://") {
            self.imageURL = URL(string: urlString)
        } else {
            self.imageURL = nil
        }
        self.title = volumeInfo?.title ?? "Unknown"
        self.author = volumeInfo?.authors?.joined(separator: ", ") ?? "Unknown"
    }
}
