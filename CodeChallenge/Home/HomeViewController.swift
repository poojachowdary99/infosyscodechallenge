//
//  HomeViewController.swift
//  CodeChallenge
//
//  Created by Pooja on 5/20/21.
//

import UIKit

final class HomeViewController: ViewModelUIViewController<HomeView, HomeViewModel>, UITableViewDelegate, UITableViewDataSource {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    fetchData()
  }
  
  private func setupView() {
    view.backgroundColor = .white
    
    customView.tableView.delegate = self
    customView.tableView.dataSource = self
  }
  
  func fetchData() {
    viewModel.loadData {
      DispatchQueue.main.async {
        self.customView.tableView.reloadData()
      }
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = viewModel.items[indexPath.row]
    switch item {
    case .feed(let vm):
      guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeContentTableViewCell.reuseIdentifier, for: indexPath) as? HomeContentTableViewCell
      else {
        return UITableViewCell()
      }
      cell.itemView.viewModel = vm
      return cell
      
    case .loader:
      return UITableViewCell()
    }
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let height = scrollView.frame.size.height
    let contentYoffset = scrollView.contentOffset.y
    let distanceFromBottom = scrollView.contentSize.height - contentYoffset
    if distanceFromBottom < height {
      DispatchQueue.global().async {
        self.fetchData()
      }
    }
  }
}
