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
            collectionView.backgroundColor = UIColor.yellow
        }
    }
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var titleView: UIView! {
        didSet {
            //ViewTool.addGradientBackground(to: titleView, using: [UIColor.yellow.cgColor, UIColor.orange.cgColor])
            ViewTool.addShadow(to: titleView)
            titleView.backgroundColor = UIColor.orange
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    let cells = MenuCells()
    let CELLS_FOR_ROW: CGFloat = 1
    let CELLS_FOR_COLUMN: CGFloat = 1
    
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
        cell.backgroundColor = cells.cellColors[indexPath.item]
        cell.initView(with: cells.images[indexPath.item])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }

}

// MARK: CollectionView highlight methods
extension ViewController {
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let clickedCell = collectionView.cellForItem(at: indexPath) as? CVCell
        //clickedCell?.backgroundColor? = cells.highlightedCellColors[indexPath.item]
        ViewTool.removeShadow(from: (clickedCell?.imageView)!)
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let clickedCell = collectionView.cellForItem(at: indexPath) as? CVCell
        //clickedCell?.backgroundColor? = cells.cellColors[indexPath.item]
        ViewTool.addShadow(to: (clickedCell?.imageView)!)

    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
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

class MenuCells {
    
    let count = 4
    let images: [UIImage] = [#imageLiteral(resourceName: "playIcon"), #imageLiteral(resourceName: "settingsIcon"), #imageLiteral(resourceName: "infoIcon"), #imageLiteral(resourceName: "highscoresIcon")]
    let cellColors: [UIColor] = [UIColor(red: 1, green: 0.9, blue: 0, alpha: 1),
                                 UIColor(red: 1, green: 0.8, blue: 0, alpha: 1),
                                 UIColor(red: 1, green: 0.7, blue: 0, alpha: 1),
                                 UIColor(red: 1, green: 0.6, blue: 0, alpha: 1)]
    let highlightedCellColors: [UIColor] = [UIColor(red: 0.8, green: 0.4, blue: 0, alpha: 1),
                                            UIColor(red: 0.8, green: 0.4, blue: 0, alpha: 1),
                                            UIColor(red: 0.8, green: 0.4, blue: 0, alpha: 1),
                                            UIColor(red: 0.8, green: 0.4, blue: 0, alpha: 1)]
    
}
