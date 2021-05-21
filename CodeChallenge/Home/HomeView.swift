//
//  HomeView.swift
//  CodeChallenge
//
//  Created by Pooja on 5/20/21.
//

import UIKit

class HomeViewModel {
  enum Item {
    case feed(HomeContentViewModel)
    case loader
  }
  
  private var feedItems: [HomeContentViewModel] = []
  private var currentLink: String = ""
  private var firstTimeRequest: Bool = true
  
  var items: [Item] {
    var _items: [Item] = []
    feedItems.forEach { vm in
      _items.append(.feed(vm))
    }
    _items.append(.loader)

    return _items
  }
  
  func loadData(completion: @escaping () -> Void) {
    if !firstTimeRequest {
      guard !currentLink.isEmpty else { return }
    } else {
      firstTimeRequest = false
    }
    
    NetworkController.fetch(.list(afterLink: currentLink)) { (result: Result<ListWrapper>) in
      switch result {
      case .success(let wrapper):
        wrapper.data.children.forEach { list in
          let feedVM = HomeContentViewModel(url: list.data.image,
                                            title: list.data.title,
                                            comment: String(list.data.commentNumber ?? 0),
                                            score: String(list.data.score ?? 0))
          
          DispatchQueue.global().sync {
            self.feedItems.append(feedVM)
          }
        }
        self.currentLink = wrapper.data.after ?? ""
      case .failure:
        break
      }
      completion()
    }
  }
}

final class HomeView: ViewModelUIView<HomeViewModel> {
  
  let tableView: UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = .clear
    tableView.separatorStyle = .none
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.rowHeight = UITableView.automaticDimension
    tableView.sectionFooterHeight = UITableView.automaticDimension
    tableView.sectionHeaderHeight = UITableView.automaticDimension

    tableView.register(HomeContentTableViewCell.self, forCellReuseIdentifier: HomeContentTableViewCell.reuseIdentifier)
    
    return tableView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    backgroundColor = .white
    
    addSubview(tableView)
    
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      tableView.topAnchor.constraint(equalTo: topAnchor),
      tableView.widthAnchor.constraint(equalTo: widthAnchor),
      tableView.heightAnchor.constraint(equalTo: heightAnchor)
    ])
  }
}
