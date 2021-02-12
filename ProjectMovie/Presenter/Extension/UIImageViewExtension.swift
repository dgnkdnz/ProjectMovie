//
//  UIImageExtension.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import UIKit

extension UIImageView {
    func setImage(withUrl url: URL) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard
                error == nil,
                let data = data
            else {
                return
            }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self?.image = image
            }
        }
        task.resume()
    }
}


