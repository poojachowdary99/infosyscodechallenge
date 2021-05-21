//
//  URLBuilder.swift
//  CodeChallenge
//
//  Created by Pooja on 5/20/21.
//

import UIKit

protocol URLBuilder {
  var url: URL { get }
  func buildURL() -> URL 
}

struct CodeChallengeURLBuilder: URLBuilder {
  var url: URL {
    return URL(string: "https://www.reddit.com/")!
  }
  
  let path: String
  
  func buildURL() -> URL {
    return url.appendingPathComponent(path, isDirectory: false)
  }
}
