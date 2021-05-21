//
//  List.swift
//  CodeChallenge
//
//  Created by Pooja on 5/20/21.
//

import UIKit

struct ListWrapper: Decodable {
  public let data: Data
  
  public struct Data: Decodable {
    public let children: [List]
    public let after: String?
  }
}

struct List: Decodable {
  public let kind: String
  public let data: Data
  
  public struct Data: Codable, Hashable {
    public let image: URL?
    public let title: String?
    public let commentNumber: Int?
    public let score: Int?
    public let thumbnailWidth: Int?
    public let thumbnailHeight: Int?

    private enum CodingKeys: String, CodingKey {
      case commentNumber = "num_comments"
      case title
      case score
      case image = "url"
      case thumbnailHeight = "thumbnail_height"
      case thumbnailWidth = "thumbnail_width"
    }
  }
}
