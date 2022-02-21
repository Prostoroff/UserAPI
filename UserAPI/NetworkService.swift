//
//  NetworkService.swift
//  UserAPI
//
//  Created by Иван Осипов on 21.02.2022.
//

import Foundation

class NetworkService {
    func request(urlString: String, completion: @escaping (Result<Results, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
                
                guard  let data = data else { return }
                do {
                    let user = try JSONDecoder().decode(Results.self, from: data)
                    completion(.success(user))
                } catch let jsonError {
                    print(jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
