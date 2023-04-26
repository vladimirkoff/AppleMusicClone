//
//  Extensions.swift
//  AppleMusicClone
//
//  Created by Vladimir Kovalev on 26.04.2023.
//

import UIKit

extension UIButton {
    func setLargeSize(image: String, size: CGFloat) {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: size, weight: .bold, scale: .large)
               
        let largeBoldDoc = UIImage(systemName: image, withConfiguration: largeConfig)

        self.setImage(largeBoldDoc, for: .normal)
    }
}
