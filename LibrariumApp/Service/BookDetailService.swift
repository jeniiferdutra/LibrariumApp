//
//  BookDetailService.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 09/07/25.
//

import Foundation

class BookDetailService {
    
    func fetchBookDetail(for volumeId: String, completion: @escaping (Result<Item, Error>) -> Void) {
        let urlString = "https://www.googleapis.com/books/v1/volumes/\(volumeId)?key=AIzaSyBMx7mkzxROsxUkZPJY8TJkX51vCMNDBwo"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(ErrorDetail.errorURL(urlString: urlString)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(ErrorDetail.requestFailed(error: error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(ErrorDetail.detailError(detail: "Data is nil")))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(ErrorDetail.invalidStatusCode(code: (response as? HTTPURLResponse)?.statusCode ?? -1)))
                return
            }
            
            do {
                let bookDetail = try JSONDecoder().decode(Item.self, from: data)
                completion(.success(bookDetail))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
