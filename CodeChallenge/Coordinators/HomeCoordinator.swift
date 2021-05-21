//
//  HomeCoordinator.swift
//  CodeChallenge
//
//  Created by Pooja on 5/20/21.
//

import UIKit

class HomeCoordinator: NavigationCoordinator {

  override func start() {
    super.start()
    
    setupHomeViewController()
  }
  
  private func setupHomeViewController() {
    let vc = HomeViewController(viewModel: HomeViewModel())
    navigationController.setViewControllers([vc], animated: false)
  }
}
