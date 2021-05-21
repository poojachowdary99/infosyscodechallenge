//
//  MainCoordinator.swift
//  CodeChallenge
//
//  Created by Pooja on 5/20/21.
//

import UIKit

class MainCoordinator: NavigationCoordinator {
  
  var window: UIWindow?
  
  func launch(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
    setupVCs()
  }
  
  override func start() {
    super.start()
  }
  
  private func setupVCs() {
    window = UIWindow(frame: UIScreen.main.bounds)

    let home = HomeCoordinator()
    add(home)
    home.start()
    
    window?.rootViewController = home.navigationController
    window?.makeKeyAndVisible()
  }
}
