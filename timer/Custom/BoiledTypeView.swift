//
//  BoiledTypeView.swift
//  timer
//
//  Created by Rustin Wilde on 01.04.23.
//

import UIKit

class BoiledTypeView : UIView {
    
    let typeView = UIView()
    let typeTitle = UILabel()
    var imageView = UIImageView()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBoiledType ()
    }
    
    required init? (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setBoiledType () {
        
       addSubview(typeView)
        self.typeView.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        self.typeView.heightAnchor.constraint(equalToConstant: 128.0).isActive = true
        typeView.layer.masksToBounds = false
        typeView.layer.borderWidth = 1.0
        typeView.layer.borderColor = UIColor(named: "inActive")?.cgColor
        typeView.layer.cornerRadius = 10
        typeView.layer.shadowColor = UIColor.black.cgColor
        typeView.layer.shadowOffset = CGSizeMake(0, 5)
        typeView.backgroundColor = .white
        typeView.layer.shadowOpacity = 0.1
        typeView.layer.shadowRadius = 5

        imageView.frame = CGRect(x: -43, y: -40, width: 180, height: 126)
        typeView.addSubview(imageView)
        typeView.addSubview(typeTitle)

    }
    
    func setFrame (x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        typeView.frame = CGRect(x: x, y: y, width: width, height: height)

    }
    
    func setLbl (x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, text: String) {
        self.typeTitle.frame = CGRect(x: x, y: y, width: width, height: height)
        self.typeTitle.text = text
        self.typeTitle.font = UIFont(name: "SourceSansPro-Regular", size: 15)
        self.typeTitle.numberOfLines = 2
    }
    
    func optionTapped() {
        typeView.layer.borderWidth = 1
        typeView.layer.borderColor = UIColor(named: "active")?.cgColor
        typeTitle.textColor = UIColor(named: "active")
        typeTitle.font = UIFont(name: "SourceSansPro-Bold", size: 15.0)
    }
    
    func viewOriginalState() {
        typeView.layer.borderWidth = 1
        typeView.layer.borderColor = UIColor(named: "inActive")?.cgColor
        typeView.layer.cornerRadius = 10
        typeView.layer.borderWidth = 1.0
        typeTitle.font = UIFont(name: "SourceSansPro-Regular", size: 15)
        typeTitle.textColor = .lightGray
    }

    
}
