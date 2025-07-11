//
//  BookDetailViewModel.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 10/05/25.
//

//import UIKit
//
//class BookDetailViewModel {
//    
//    private var detail: BookDetailData = BookDetailData()
//    private let book: Book?
//    private let service = BookDetailService()
//    private var editionDetail: EditionDetailData?
//    private let editionService = EditionDetailService()
//    
//    init(book: Book?) {
//        self.book = book
//    }
//    
//    func fetchBookDetail(completion: @escaping () -> Void) {
//        guard let workKey = book?.key,
//              let editionKey = book?.editionKey?.first else {
//            completion()
//            return
//        }
//        
//        // Fetch WORK
//        service.fetchBookDetail(for: workKey) { [weak self] result in
//            switch result {
//            case .success(let detail):
//                self?.detail = detail
//                
//                // Fetch EDITION depois que o WORK for carregado
//                self?.editionService.fetchEditionDetail(for: editionKey) { editionResult in
//                    switch editionResult {
//                    case .success(let editionDetail):
//                        self?.editionDetail = editionDetail
//                    case .failure(let error):
//                        print("Erro ao buscar edição: \(error)")
//                    }
//                    
//                    DispatchQueue.main.async {
//                        completion()
//                    }
//                }
//                
//            case .failure(let error):
//                print("Erro ao buscar detalhe: \(error)")
//                DispatchQueue.main.async {
//                    completion()
//                }
//            }
//        }
//    }
//
//    
//    var title: String {
//        detail.title ?? book?.title ?? "Sem título"
//    }
//    
//    var author: String {
//        book?.authors?.compactMap { $0.name }.joined(separator: ", ") ?? "Autor desconhecido"
//    }
//    
//    var description: String {
//        detail.description?.value ?? "Sem sinopse disponível."
//    }
//    
//    var imageBookURL: URL? {
//        guard let id = detail.covers?.first ?? book?.coverId else { return nil }
//        return URL(string: "https://covers.openlibrary.org/b/id/\(id)-L.jpg")
//    }
//    
//    var bookDetailData: BookDetailData {
//        return detail
//    }
//    
//    var publisher: String {
//        editionDetail?.publishers?.joined(separator: ", ") ?? "Desconhecida"
//    }
//
//    var languageCode: String {
//        guard let langKey = editionDetail?.languages?.first?.key else { return "N/A" }
//        return langKey.replacingOccurrences(of: "/languages/", with: "").uppercased()
//    }
//    
//    var numberOfPages: Int? {
//        editionDetail?.numberOfPages
//    }
//    
//    var editionDetailData: EditionDetailData? {
//        return editionDetail
//    }
//}
