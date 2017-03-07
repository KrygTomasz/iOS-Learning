//
//  GameVC.swift
//  Collection
//
//  Created by Kryg Tomasz on 06.03.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

class GameVC: UIViewController {

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
    
    let CELLS_FOR_ROW: CGFloat = 4
    let CELLS_FOR_COLUMN: CGFloat = 2
    var numberOfCells: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfCells = CELLS_FOR_ROW * CELLS_FOR_COLUMN
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(numberOfCells)
    }
    
    // MARK: CollectionView click methods
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let frontCell = collectionView.cellForItem(at: indexPath)?.contentView
        guard let backCell: GameCVCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCVCell", for: indexPath) as? GameCVCell else { return }
        UIView.transition(from: frontCell!, to: backCell, duration: 3.0, options: .transitionFlipFromLeft, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        guard let cell: GameCVCell = collectionView.cellForItem(at: indexPath) as? GameCVCell else { return }
        cell.backgroundColor = .red
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        guard let cell: GameCVCell = collectionView.cellForItem(at: indexPath) as? GameCVCell else { return }
        cell.backgroundColor = UIColor(red: CGFloat(indexPath.item)/CGFloat(numberOfCells), green: 1, blue: CGFloat(indexPath.item)/CGFloat(numberOfCells), alpha: 1)
    }
    
}

extension GameVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width/CELLS_FOR_ROW
        let cellHeight = collectionView.bounds.height/CELLS_FOR_COLUMN
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}