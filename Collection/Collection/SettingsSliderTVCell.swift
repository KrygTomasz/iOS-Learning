//
//  SettingsSliderTVCell.swift
//  Collection
//
//  Created by Kryg Tomasz on 08.03.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

enum SliderCellType {
    case width
    case height
}

class SettingsSliderTVCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider! {
        didSet {
            slider.addTarget(self, action: #selector(sliderChanged), for: .touchUpInside)
            slider.minimumValue = 3
            slider.maximumValue = 8
        }
    }
    
    @IBOutlet weak var minimumLabel: UILabel!
    
    @IBOutlet weak var maximumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private var type: SliderCellType?
    private var userDefaultsName: String?
    
    func sliderChanged(sender: UISlider) {
        
        let wholeValue: Float = round(sender.value)
        
        sender.setValue(wholeValue, animated: true)
        saveState()
        
    }
    
    func saveState() {
        
        guard let key: String = userDefaultsName else { return }
        UserDefaults().setValue(slider.value, forKey: key)
        
    }
    
    func setView(type: SliderCellType) {
        
        self.type = type
        loadState()
        
    }
    
    private func loadState() {
        
        guard let cellType: SliderCellType = type else { return }
        switch cellType {
        case .height:
            titleLabel.text = "Adjust height"
            slider.minimumValue = 4
            slider.maximumValue = 8
            userDefaultsName = Defaults.CARD_HEIGHT
        case .width:
            slider.minimumValue = 3
            slider.maximumValue = 5
            titleLabel.text = "Adjust width"
            userDefaultsName = Defaults.CARD_WIDTH
        }
        
        minimumLabel.text = "\(slider.minimumValue)"
        maximumLabel.text = "\(slider.maximumValue)"
        
        guard let key: String = userDefaultsName,
            let value: Float = UserDefaults().value(forKey: key) as? Float else { return }
        slider.setValue(value, animated: true)
        
    }
}
