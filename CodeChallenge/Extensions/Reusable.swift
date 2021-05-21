//
//  Reusable.swift
//  CodeChallenge
//
//  Created by Pooja on 5/20/21.
//

import UIKit

protocol Reusable {
  static var reuseIdentifier: String { get }
}

extension Reusable {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}

extension UITableViewCell: Reusable {}
