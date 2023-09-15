//
//  ColorViewExtension.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 11.09.2023.
//

import UIKit

extension UIColor {
    convenience init(rgb: UInt) {
       self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgb & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
    }
}

extension UIView {
    func customColorGradientGreen() {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(rgb: 0x081212).cgColor,
            UIColor(rgb: 0x153535).cgColor,
            UIColor(rgb: 0x1d4c50).cgColor
        ]
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.frame = self.bounds
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func customColorGradientGray() {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(rgb: 0x081212).cgColor,
            UIColor(rgb: 0x153535).cgColor,
            UIColor(rgb: 0x1d4c50).cgColor
        ]
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
}
