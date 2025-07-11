////
////  BookDetailService.swift
////  LibrariumApp
////
////  Created by Jenifer Rocha on 09/07/25.
////
//
//import Foundation
//
//class BookDetailService {
//    
//    func fetchBookDetail(for key: String, completion: @escaping (Result<BookDetailData, Error>) -> Void) {
//        let urlString = "https://openlibrary.org\(key).json"
//        
//        guard let url = URL(string: urlString) else {
//            completion(.failure(ErrorDetail.errorURL(urlString: urlString)))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            
//            if let error {
//                completion(.failure(ErrorDetail.requestFailed(error: error)))
//                return
//            }
//            
//            guard let data = data else {
//                completion(.failure(ErrorDetail.detailError(detail: "Data is nil")))
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completion(.failure(ErrorDetail.invalidStatusCode(code: (response as? HTTPURLResponse)?.statusCode ?? -1)))
//                return
//            }
//            
//            do {
//                let bookDetail = try JSONDecoder().decode(BookDetailData.self, from: data)
//                completion(.success(bookDetail))
//            } catch {
//                completion(.failure(error))
//            }
//        }
//        task.resume()
//    }
//}
