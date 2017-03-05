//
//  Colors.swift
//  Collection
//
//  Created by Kryg Tomasz on 05.03.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

class Colors {
    
    static func gradient(from topColor: UIColor, to bottomColor: UIColor) -> CAGradientLayer {
        
        let topCGColor = topColor.cgColor
        let bottomCGColor = bottomColor.cgColor
        let gradient = CAGradientLayer()
        gradient.colors = [topCGColor, bottomCGColor,topCGColor]
        gradient.locations = [0.0, 0.5, 1.0]
        return gradient
        
    }
}
