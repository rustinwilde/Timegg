//
//  BoiledType.swift
//  timer
//
//  Created by Rustin Wilde on 01.04.23.
//

import UIKit

struct EggBoiledType {
    var image : UIImage!
    var title : String!
}

let boiledTypes : [EggBoiledType] = [
    EggBoiledType(image: UIImage(named: "Soft egg"), title: "Soft boiled"),
    EggBoiledType(image: UIImage(named: "Medium boiled"), title: "Medium boiled"),
    EggBoiledType(image: UIImage(named: "Hard boiled"), title: "Hard boiled")
]
