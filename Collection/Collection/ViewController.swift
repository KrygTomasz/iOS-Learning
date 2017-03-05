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
            collectionView.register(CVCell.self, forCellWithReuseIdentifier: "CVCell")
        }
    }
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var titleView: UIView! {
        didSet {
            //titleView.backgroundColor = UIColor.yellow
            let backgroundLayer = Colors.gradient(from: .red, to: .blue)
            titleView.backgroundColor = UIColor.clear
            backgroundLayer.frame = titleView.frame
            titleView.layer.insertSublayer(backgroundLayer, at: 0)
            ViewTool.addShadow(to: titleView)
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var numberOfCells = 4
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath)// as UICollectionViewCell
        //let cell = CVCell.instanceFromNib()
        let color = 1 - CGFloat(indexPath.row)/CGFloat(numberOfCells)
        cell.backgroundColor = UIColor.init(red: color, green: color, blue: color, alpha: 1)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCells
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
