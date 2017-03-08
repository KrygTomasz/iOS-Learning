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
    func tapCompletion()
}

class GameCVCell: UICollectionViewCell {

    @IBOutlet weak var container: UIView!
    
    var delegate: GameCVCellDelegate?
    
    private let backImageView: UIImageView! = UIImageView(image: #imageLiteral(resourceName: "cardBackImage"))
    private let frontImageView: UIImageView! = UIImageView(image: #imageLiteral(resourceName: "highscoresIcon"))
    private var showingBack = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //setView(with: #imageLiteral(resourceName: "playIcon"), isReversed: true)
        
        
        frontImageView.contentMode = .scaleAspectFill
        backImageView.contentMode = .scaleAspectFill
        
        self.container.addSubview(backImageView)
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(cellTap))
        singleTap.numberOfTapsRequired = 1
        container.addGestureRecognizer(singleTap)
        // Initialization code
    }

    func cellTap() {
        if
            let canBeTapped: Bool = delegate?.canBeTapped(),
            canBeTapped {
            flip()
        } else {
            return
        }
    }
    
    private func flip() {
        let toView = showingBack ? frontImageView : backImageView
        let fromView = showingBack ? backImageView : frontImageView
        UIView.transition(from: fromView!, to: toView!, duration: 1, options: .transitionFlipFromRight, completion: {_ in
            self.delegate?.tapCompletion()
        })
        toView?.translatesAutoresizingMaskIntoConstraints = false
        showingBack = !showingBack
    }

}
