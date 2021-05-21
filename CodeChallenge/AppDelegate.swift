//
//  AppDelegate.swift
//  CodeChallenge
//
//  Created by Pooja on 5/20/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  let coordinator: MainCoordinator = MainCoordinator()
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    coordinator.launch(application: application, didFinishLaunchingWithOptions: launchOptions)
    return true
  }
  
}

