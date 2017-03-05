//
//  ViewController.swift
//  Collection
//
//  Created by Kryg Tomasz on 03.03.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            let cellNib = UINib(nibName: "CVCell", bundle: nil)
            collectionView.register(cellNib, forCellWithReuseIdentifier: "CVCell")
        }
    }
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var titleView: UIView! {
        didSet {
            ViewTool.addGradientBackground(to: titleView, using: [UIColor.yellow.cgColor, UIColor.orange.cgColor])
            ViewTool.addShadow(to: titleView)
            titleView.backgroundColor = UIColor.yellow
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var numberOfCells = 4
    let CELLS_FOR_ROW: CGFloat = 1
    let CELLS_FOR_COLUMN: CGFloat = 1
    
    let itemColors: [UIColor] = [UIColor(red: 1, green: 0.9, blue: 0, alpha: 1),
                                 UIColor(red: 1, green: 0.8, blue: 0, alpha: 1),
                                 UIColor(red: 1, green: 0.7, blue: 0, alpha: 1),
                                 UIColor(red: 1, green: 0.6, blue: 0, alpha: 1)]
    let highlightedItemColors: [UIColor] = [UIColor(red: 1, green: 1, blue: 0, alpha: 1),
                                            UIColor(red: 1, green: 0.9, blue: 0, alpha: 1),
                                            UIColor(red: 1, green: 0.8, blue: 0, alpha: 1),
                                            UIColor(red: 1, green: 0.7, blue: 0, alpha: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath) as? CVCell else { return UICollectionViewCell() }
        //let cell = CVCell.instanceFromNib()
        //let color = 1 - CGFloat(indexPath.row)/CGFloat(numberOfCells)
        cell.backgroundColor = itemColors[indexPath.item]
        cell.initView(with: #imageLiteral(resourceName: "playIcon"))
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCells
    }

}

// MARK: CollectionView highlight methods
extension ViewController {
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let clickedCell = collectionView.cellForItem(at: indexPath)
        clickedCell?.backgroundColor? = highlightedItemColors[indexPath.item]
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let clickedCell = collectionView.cellForItem(at: indexPath)
        clickedCell?.backgroundColor? = itemColors[indexPath.item]

    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width/CELLS_FOR_ROW
        let cellHeight = collectionView.bounds.height/CELLS_FOR_COLUMN
        print("Wysokosc: \(cellHeight)")
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
