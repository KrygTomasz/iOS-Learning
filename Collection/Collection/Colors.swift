//
//  Colors.swift
//  Collection
//
//  Created by Kryg Tomasz on 05.03.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

class Colors {
    
    static func gradient(using colors: [CGColor]) -> CAGradientLayer {
        
        let gradient = CAGradientLayer()
        gradient.colors = colors
        for i in 0..<colors.count {
            let location: NSNumber = (NSNumber(value: (Float)(i)/(Float)(colors.count)))
            gradient.locations?.append(location)
        }
        return gradient
        
    }
}

extension UIColor {
    
    func lighter(by percentage:CGFloat=30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    func darker(by percentage:CGFloat=30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage:CGFloat=30.0) -> UIColor? {
        var r:CGFloat=0, g:CGFloat=0, b:CGFloat=0, a:CGFloat=0;
        if(self.getRed(&r, green: &g, blue: &b, alpha: &a)){
            return UIColor(red: min(r + percentage/100, 1.0),
                           green: min(g + percentage/100, 1.0),
                           blue: min(b + percentage/100, 1.0),
                           alpha: a)
        } else {
            return nil
        }
    }
}
