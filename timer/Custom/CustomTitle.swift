//
//  TitleSector.swift
//  timer
//
//  Created by Rustin Wilde on 31.03.23.
//

import UIKit

class CustomTitle : UILabel {
    
    var titleSector = UILabel()
    
    func titleSetup() {
        addSubview(titleSector)
        
        titleSector.font = UIFont(name: "SourceSansPro-SemiBold", size: 20)
        titleSector.textColor = .black
        
    }
    
    
    
}
