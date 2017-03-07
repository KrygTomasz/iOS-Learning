//
//  GameCVCell.swift
//  Collection
//
//  Created by Kryg Tomasz on 06.03.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

class GameCVCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setView(with: #imageLiteral(resourceName: "playIcon"), isReversed: true)
        // Initialization code
    }
    
    var frontImage: UIImage?
    var backImage: UIImage?
    var isReversed = true
    
    func setView(with image: UIImage, isReversed: Bool) {
        
        imageView.image = image
        frontImage = image
        backImage = image
        self.isReversed = isReversed
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTap))
        self.addGestureRecognizer(tapGesture)
        
    }
    
    func cellTap() {
        let front = UIImageView(image: frontImage)
        let back = UIView(frame: self.frame)
        back.backgroundColor = UIColor.black
        self.contentView.addSubview(back)
        if isReversed {
            UIView.transition(from: back, to: front, duration: 1.0, options: .transitionFlipFromLeft, completion: nil)
            isReversed = false
        } else {
            UIView.transition(from: front, to: back, duration: 1.0, options: .transitionFlipFromLeft, completion: nil)
            isReversed = true
        }
        
    }

}
