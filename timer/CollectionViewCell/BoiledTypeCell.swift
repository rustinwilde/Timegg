//
//  BoiledTypeCell.swift
//  timer
//
//  Created by Rustin Wilde on 01.04.23.
//

import UIKit

class BoiledTypeCell: UICollectionViewCell {
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var imageOption: UIImageView!
    @IBOutlet weak var optionText: UILabel!
    
    var boiledTypeArray = [EggBoiledType]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
            
    }
    
    func setup (withType: EggBoiledType) {
        imageOption.image = withType.image
        optionText.text = withType.title
    }

}
