//
//  ImageLoader.swift
//  CodeChallenge
//
//  Created by Pooja on 5/20/21.
//

import UIKit
import Nuke

class ImageLoader {
  
  static let shared = ImageLoader()
  
  private init() {}
  
  func loadImage(from url: URL?, withImageView imageView: UIImageView) {
    guard let url = url else { return }
    let request = ImageRequest(url: url)
    let options = ImageLoadingOptions(placeholder: nil,
                                      transition: .fadeIn(duration: 0.3),
                                      failureImage: nil,
                                      contentModes: .init(success: .scaleAspectFill,
                                                          failure: .scaleAspectFill,
                                                          placeholder: .scaleAspectFill))
    Nuke.loadImage(with: request, options: options, into: imageView)
  }
  
  func cancel(for imageView: UIImageView) {
    Nuke.cancelRequest(for: imageView)
  }
}

extension UIImageView {
  func loadImage(at url: URL?) {
    ImageLoader.shared.loadImage(from: url, withImageView: self)
  }
  
  func cancelLoad() {
    ImageLoader.shared.cancel(for: self)
  }
}
