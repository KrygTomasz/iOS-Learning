//
//  GameCVCell.swift
//  Collection
//
//  Created by Kryg Tomasz on 06.03.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

protocol GameCVCellDelegate: class {
    func canBeTapped() -> Bool
    func flippingCompletion()
}

class GameCVCell: UICollectionViewCell {

    @IBOutlet weak var container: UIView!
    
    var delegate: GameCVCellDelegate?
    
    private let backImageView: UIImageView! = UIImageView(image: #imageLiteral(resourceName: "cardBackImage"))
    private let frontImageView: UIImageView! = UIImageView(image: #imageLiteral(resourceName: "highscoresIcon"))
    private var showingBack = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        frontImageView.contentMode = .scaleAspectFill
        backImageView.contentMode = .scaleAspectFill
        
        self.container.addSubview(backImageView)
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        
        //let singleTap = UITapGestureRecognizer(target: self, action: #selector(tap))
        //singleTap.numberOfTapsRequired = 1
        //container.addGestureRecognizer(singleTap)
        // Initialization code
    }

    func tryFlip() -> Bool {
        if
            let canBeTapped: Bool = delegate?.canBeTapped(),
            canBeTapped {
            flip()
            return true
        } else {
            return false
        }
    }
    
    private func flip() {
        let toView = showingBack ? frontImageView : backImageView
        let fromView = showingBack ? backImageView : frontImageView
        UIView.transition(from: fromView!, to: toView!, duration: 3, options: .transitionFlipFromRight, completion: {_ in
            self.delegate?.flippingCompletion()
        })
        toView?.translatesAutoresizingMaskIntoConstraints = false
        showingBack = !showingBack
    }

}
