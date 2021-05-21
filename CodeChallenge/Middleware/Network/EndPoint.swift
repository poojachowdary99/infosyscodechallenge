//
//  EndPoint.swift
//  CodeChallenge
//
//  Created by Pooja on 5/20/21.
//

import UIKit

struct EndPoint {
  let urlBuilder: URLBuilder
  let method: HttpMethod
}

extension EndPoint {
  var urlRequest: URLRequest {
    var request = URLRequest(url: urlBuilder.buildURL())
    switch method {
    case .get(let queryItems):
      guard !queryItems.isEmpty else { break }
      var comps = URLComponents(url: urlBuilder.buildURL(), resolvingAgainstBaseURL: false)
      comps?.queryItems = queryItems
      guard let url = comps?.url else { break }
      request = URLRequest(url: url)
      request.httpMethod = "GET"
    }
    
    return request
  }
}

extension EndPoint {
  
  init(path: String,
       method: HttpMethod = .get([])) {
    urlBuilder = CodeChallengeURLBuilder(path: path)
    self.method = method
  }
}

extension EndPoint {
  
  static func list(afterLink link: String = "") -> EndPoint {
    let query: [URLQueryItem] = link.isEmpty ? [] : [URLQueryItem(name: "after", value: link)]
    return EndPoint(path: ".json",
             method: .get(query))
  }
}
