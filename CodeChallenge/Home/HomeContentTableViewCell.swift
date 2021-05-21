//
//  HomeContentTableViewCell.swift
//  CodeChallenge
//
//  Created by Pooja on 5/20/21.
//

import UIKit

class HomeContentTableViewCell: UITableViewCell {

  let itemView: HomeContentView = HomeContentView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    itemView.layer.borderWidth = 0.5
    itemView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
    itemView.layer.masksToBounds = true
  }
  
  private func setupView() {
    selectionStyle = .none
    
    itemView.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(itemView)
    
    NSLayoutConstraint.activate([
      itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
      itemView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
      itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
      itemView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
    ])
  }
}
