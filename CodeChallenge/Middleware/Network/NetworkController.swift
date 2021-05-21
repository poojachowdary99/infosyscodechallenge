//
//  NetworkController.swift
//  CodeChallenge
//
//  Created by Pooja on 5/20/21.
//

import UIKit

public enum Result<Value> {
  /// A successful result wrapping a returned value.
  case success(Value)
  /// A failed result wrapping a thrown error.
  case failure(Error?)
}

final class NetworkController {
  
  static let session: URLSession = {
    let config = URLSessionConfiguration.default
    config.urlCache = nil
    
    return URLSession(configuration: config)
  }()
  
  static func fetch<T: Decodable>(_ endpoint: EndPoint, completion: @escaping (Result<T>) -> Void) {
    perform(endpoint.urlRequest) { result in
      switch result {
      case .success(let data):
        do {
          let decoder = JSONDecoder()
          let result = try decoder.decode(T.self, from: data)
          completion(.success(result))
        } catch {
          completion(.failure(nil))
        }
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  private static func perform(_ request: URLRequest, completion: @escaping ((Result<Data>) -> Void)) {
    let task = session.dataTask(with: request) { data, response, error in
      let response = response as? HTTPURLResponse
      if let data = data, response?.statusCode == 200 {
        completion(.success(data))
      } else {
        completion(.failure(error))
      }
    }
    task.priority = URLSessionDataTask.highPriority
    task.resume()
  }
}
