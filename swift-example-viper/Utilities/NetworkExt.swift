//
//  NetworkExt.swift
//  swift-example-viper
//
//  Created by Adarsh Sudarsanan on 21/11/22.
//

import Foundation

/// Custom Errors.
enum CustomError: Error {
    case invalidURL, invalidData
}

/// Constant urls.

struct UrlC {
    static let users: URL? = URL(string: "https://fd2d405a-b572-4c14-ba12-0031176d34cd.mock.pstmn.io/users")
}

extension URLSession {
    
    func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        // Guard the url.
        guard let url = url else {
            completion(.failure(CustomError.invalidURL))
            return
        }
        
        // Creating the URLSession task,.
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            // Checking if an error exists.
            if let error = error {
                completion(.failure(error))
            }
            
            // Guarding the data.
            guard let data = data else {
                completion(.failure(CustomError.invalidData))
                return
            }
            
            // Decoding the received data.
            do {
                let decodedData = try JSONDecoder().decode(expecting, from: data)
                completion(.success(decodedData))
                return
            } catch {
                completion(.failure(error))
                return
            }

        }
        
        // Kickstarting the task.
        task.resume()
        
    }
}
