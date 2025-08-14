
//  BookDetailViewModel.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 10/05/25.


import UIKit

class BookDetailViewModel {
    
    private var volumeId: String
    private var item: Item?
    private let service = BookDetailService()
    
    
    init(volumeId: String) {
        self.volumeId = volumeId
    }
    
    func fetchBookDetail(completion: @escaping () -> Void) {
        service.fetchBookDetail(for: volumeId) { [weak self] result in
            switch result {
            case .success(let item):
                self?.item = item
            case .failure(let error):
                print("Erro: \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    var bookDetailData: Item? {
        return item
    }
    
    var title: String {
        item?.volumeInfo?.title ?? "Untitled"
    }
    
    var author: String {
        item?.volumeInfo?.authors?.joined(separator: ", ") ?? "Unknown author"
    }
    
    var imageBookURL: URL? {
        if let urlString = item?.volumeInfo?.imageLinks?.thumbnail?.replacingOccurrences(of: "http://", with: "https://") {
            return URL(string: urlString)
        }
        return nil
    }
    
    var description: String {
        item?.volumeInfo?.description ?? "No description available."
    }
    
    var webReaderLink: String? {
        return bookDetailData?.accessInfo?.webReaderLink
    }
}

