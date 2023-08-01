//
//  UIImageView+Extensions.swift
//  JustoChallenge
//
//  Created by Miguel Elduque on 31/07/23.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    func rounded() {
        layer.masksToBounds = true
        layer.cornerRadius = self.frame.height / 2
    }
}
