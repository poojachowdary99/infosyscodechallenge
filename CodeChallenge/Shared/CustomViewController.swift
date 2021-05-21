//
//  CustomViewController.swift
//  CodeChallenge
//
//  Created by Pooja on 5/20/21.
//

import UIKit

class CustomViewController<ViewType: UIView>: UIViewController {
  
  var customView: ViewType {
    return view as! ViewType
  }
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    view = ViewType(frame: UIScreen.main.bounds)
  }
}

class ViewModelUIViewController<ViewType: UIView, ViewModelType>: CustomViewController<ViewType> {
  
  var viewModel: ViewModelType
  
  required init(viewModel: ViewModelType) {
    self.viewModel = viewModel
    super.init()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
