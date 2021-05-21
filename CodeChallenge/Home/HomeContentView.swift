//
//  HomeContentView.swift
//  CodeChallenge
//
//  Created by Pooja on 5/20/21.
//

import UIKit

struct HomeContentViewModel {
  let url: URL?
  let title: String?
  let comment: String?
  let score: String?
}

class HomeContentView: ViewModelUIView<HomeContentViewModel> {

  private lazy var contentStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel, commentLabel, scoreLabel])
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.distribution = .fill
    stackView.spacing = 8
    
    return stackView
  }()
    
  private let imageView = UIImageView()
 
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    
    return label
  }()
  
  private let commentLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    
    return label
  }()
  
  private let scoreLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    
    return label
  }()
  
  override var viewModel: HomeContentViewModel? {
    didSet {
      update()
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    backgroundColor = .white
    
    imageView.clipsToBounds = true
    
    contentStackView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(contentStackView)
    
    NSLayoutConstraint.activate([
      contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      contentStackView.topAnchor.constraint(equalTo: topAnchor),
      contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  func update() {
    imageView.loadImage(at: viewModel?.url)
    scoreLabel.text = viewModel?.score
    commentLabel.text = viewModel?.comment
    titleLabel.text = viewModel?.title
  }
  
  func prepareForReuse() {
    imageView.image = nil
    scoreLabel.text = nil
    titleLabel.text = nil
    commentLabel.text = nil
  }
}
