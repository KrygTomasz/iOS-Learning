//
//  GameVC.swift
//  Collection
//
//  Created by Kryg Tomasz on 06.03.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

class GameVC: UIViewController {

    @IBOutlet weak var exitButton: UIButton! {
        didSet {
            exitButton.setTitle("EXIT", for: .normal)
            exitButton.addTarget(self, action: #selector(exitButtonClick), for: .touchUpInside)
        }
    }
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            let nibCell = UINib(nibName: "GameCVCell", bundle: nil)
            collectionView.register(nibCell, forCellWithReuseIdentifier: "GameCVCell")
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.backgroundColor = UIColor.black
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    var cellsForRow: CGFloat = 4
    var cellsForColumn: CGFloat = 6
    var numberOfCells: CGFloat = 0
    
    //var cardIsFlipping: Bool = false
    var flippedCards: [IndexPath] = []
    var canBeFlipped: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        numberOfCells = cellsForRow * cellsForColumn
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func loadData() {
        
        guard let rowCells: Float = UserDefaults().value(forKey: Defaults.CARD_WIDTH) as? Float,
            let columnCells: Float = UserDefaults().value(forKey: Defaults.CARD_HEIGHT) as? Float else {
                UserDefaults().setValue(4, forKey: Defaults.CARD_WIDTH)
                UserDefaults().setValue(4, forKey: Defaults.CARD_HEIGHT)
                return
        }
        cellsForRow = CGFloat(rowCells)
        cellsForColumn = CGFloat(columnCells)

    }
    
    func exitButtonClick() {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GameVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: GameCVCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCVCell", for: indexPath) as? GameCVCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = UIColor(red: CGFloat(indexPath.item)/CGFloat(numberOfCells), green: 1, blue: CGFloat(indexPath.item)/CGFloat(numberOfCells), alpha: 1)
        cell.delegate = self
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(numberOfCells)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.item)")
        guard let cell = collectionView.cellForItem(at: indexPath) as? GameCVCell else { return }
        if cell.tryFlip() {
            flippedCards.append(indexPath)
        }
    }
    
}

extension GameVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width/cellsForRow
        let cellHeight = collectionView.bounds.height/cellsForColumn
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

extension GameVC: GameCVCellDelegate {
    
//    func canBeTapped() -> Bool {
//        if cardIsFlipping {
//            return false
//        }
//        cardIsFlipping = true
//        return true
//    }
//    
//    func tapCompletion() {
//        cardIsFlipping = false
//    }
    
    func canBeTapped() -> Bool {
        if flippedCards.count < 2 {
            if flippedCards.count == 1 {
                canBeFlipped = false
                }
            return true
        }
        canBeFlipped = false
        return false
    }
    
    func flippingCompletion() {
        if !canBeFlipped {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                // here implement flip back
                // flipBack()
                self.canBeFlipped = true
                self.flippedCards.removeAll()
                print("Can be flipped")
            })
        }
        canBeFlipped = true
    }
    
    private func unflipShowedCards() {
        
    }
    
}
