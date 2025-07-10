//
//  BookDetailViewModel.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 10/05/25.
//

import UIKit

class BookDetailViewModel {
    
    private var detail: BookDetailData = BookDetailData()
    private let book: Book?
    private let service = BookDetailService()
    
    init(book: Book?) {
        self.book = book
    }
    
    func fetchBookDetail(completion: @escaping () -> Void) {
        guard let key = book?.key else { return }
        
        service.fetchBookDetail(for: key) { [weak self] result in
            switch result {
            case .success(let detail):
                self?.detail = detail
                DispatchQueue.main.async {
                    completion()
                }
            case .failure(let error):
                print("Erro ao buscar detalhe: \(error)")
                DispatchQueue.main.async {
                    completion()
                }
            }
        }
    }
    
    var title: String {
        detail.title ?? book?.title ?? "Sem título"
    }
    
    var author: String {
        book?.authors?.compactMap { $0.name }.joined(separator: ", ") ?? "Autor desconhecido"
    }
    
    var description: String {
        detail.description?.value ?? "Sem sinopse disponível."
    }
    
    var imageBookURL: URL? {
        guard let id = detail.covers?.first ?? book?.coverId else { return nil }
        return URL(string: "https://covers.openlibrary.org/b/id/\(id)-L.jpg")
    }
    
    var bookDetailData: BookDetailData {
        return detail
    }
}
