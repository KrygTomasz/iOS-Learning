//
//  ViewTool.swift
//  Collection
//
//  Created by Kryg Tomasz on 05.03.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

class ViewTool {
    
    static func addShadow(to view: UIView) {
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowRadius = 4
        view.layer.shouldRasterize = false
        view.layer.shadowOpacity = 0.8
        view.layer.masksToBounds = false
        
    }
    
}
