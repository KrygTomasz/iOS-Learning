//
//  CVCell.swift
//  Collection
//
//  Created by Kryg Tomasz on 03.03.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

class CVCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func instanceFromNib() -> CVCell {
        guard let cell = UINib(nibName: "CVCell", bundle: nil).instantiate(withOwner: self, options: nil).first as? CVCell else {
            return CVCell()
        }
        cell.backgroundColor = UIColor.black
        return cell
    }

}
