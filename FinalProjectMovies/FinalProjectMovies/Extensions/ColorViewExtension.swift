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
    func customColorGradientMainView() {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(rgb: 0x2b0f1f).cgColor,
            UIColor(rgb: 0x1f2547).cgColor,
            UIColor(rgb: 0x3e65a8).cgColor,
            UIColor(rgb: 0x123b6e).cgColor,
            UIColor(rgb: 0x121436).cgColor
        ]
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.frame = self.bounds
        gradient.startPoint = CGPoint(x: 0, y: 0.3)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.3)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func customColorGradientGreen() {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(rgb: 0x367d49).cgColor,
            UIColor(rgb: 0x469243).cgColor,
            UIColor(rgb: 0x56aa3d).cgColor
        ]
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.frame = self.bounds
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func customColorGradientPinc() {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(rgb: 0x5329fc).cgColor,
            UIColor(rgb: 0xeb435d).cgColor,
            UIColor(rgb: 0x4a1826).cgColor,
            UIColor(rgb: 0xc03540).cgColor
        ]
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.frame = self.bounds
        gradient.startPoint = CGPoint(x: 0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func customColorGradientRed() {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(rgb: 0x4a1826).cgColor,
            UIColor(rgb: 0xb6243f).cgColor,
            UIColor(rgb: 0xc03540).cgColor
        ]
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.frame = self.bounds
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.layer.insertSublayer(gradient, at: 0)
    }
}
