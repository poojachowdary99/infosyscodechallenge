//
//  Coordinator.swift
//  CodeChallenge
//
//  Created by Pooja on 5/20/21.
//

import UIKit

class Coordinator {
  private(set) var children: [Coordinator]
  
  init(child: [Coordinator] = []) {
    children = child
  }
  
  func start() {}
  
  func add(_ child: Coordinator) {
    children.append(child)
  }
}
