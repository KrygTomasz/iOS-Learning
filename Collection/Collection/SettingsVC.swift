//
//  SettingsVC.swift
//  Collection
//
//  Created by Kryg Tomasz on 08.03.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var container: UIView! {
        didSet {
            ViewTool.addGradientBackground(to: container, using: [UIColor.orange.cgColor, UIColor.black.cgColor])
        }
    }
    
    @IBOutlet weak var exitButton: UIButton! {
        didSet {
            exitButton.setTitle("Done", for: .normal)
            exitButton.addTarget(self, action: #selector(exitButtonClick), for: .touchUpInside)
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let nibCell = UINib(nibName: "SettingsSliderTVCell", bundle: nil)
            tableView.register(nibCell, forCellReuseIdentifier: "SettingsSliderTVCell")
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    let cells: [SliderCellType] = [.height, .width]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 50
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
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

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: SettingsSliderTVCell = tableView.dequeueReusableCell(withIdentifier: "SettingsSliderTVCell", for: indexPath) as? SettingsSliderTVCell else {
            return UITableViewCell()
        }
        cell.setView(type: cells[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
}
