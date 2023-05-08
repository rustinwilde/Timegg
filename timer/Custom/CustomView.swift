//
//  CustomView.swift
//  timer
//
//  Created by Rustin Wilde on 29.03.23.
//

import UIKit

class CustomView : UIView {
    
    let optionView = UIView()
    var optionTitle = UILabel()
    var imageView = UIImageView()
   
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.isUserInteractionEnabled = true
        }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.isUserInteractionEnabled = true
        }
    
    public func setupView() {
        addSubview(optionView)
        
        optionView.translatesAutoresizingMaskIntoConstraints = false
        optionView.layer.borderWidth = 1.0
        optionView.layer.borderColor = UIColor(named: "inActive")?.cgColor
        optionView.layer.cornerRadius = 10
        
        optionTitle.font = UIFont(name: "SourceSansPro-Regular", size: 15)
        optionTitle.textColor = .lightGray
        optionTitle.frame.origin.x = optionView.frame.width/2
        optionTitle.frame.origin.y = optionView.frame.height/2
        optionView.addSubview(optionTitle)
    }
    
    func optionTapped() {
        optionView.layer.borderColor = UIColor(named: "active")?.cgColor
        optionTitle.textColor = UIColor(named: "active")
        optionTitle.font = UIFont(name: "SourceSansPro-Bold", size: 15.0)
    }
    
    func viewOriginalState() {
        optionView.layer.borderColor = UIColor(named: "inActive")?.cgColor
        optionView.layer.cornerRadius = 10
        optionView.layer.borderWidth = 1.0
        optionTitle.font = UIFont(name: "SourceSansPro-Regular", size: 15)
        optionTitle.textColor = .lightGray
    }
    
    func setupViewSize(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, widthAnchor: CGFloat, heightAnchor: CGFloat) {
        self.frame = CGRect(x: x, y: y, width: width, height: height)
        self.optionView.widthAnchor.constraint(equalToConstant: widthAnchor).isActive = true
        self.optionView.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = true
        
    }
    
    func setupLabelSize(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, text: String) {
        self.optionTitle.frame = CGRect(x: x, y: y, width: width, height: height)
        self.optionTitle.text = text
    }
    
    
    func setBoiledType () {
        
       addSubview(optionView)
        optionView.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        optionView.heightAnchor.constraint(equalToConstant: 128.0).isActive = true
        optionView.layer.masksToBounds = false
        optionView.layer.borderWidth = 1.0
        optionView.layer.borderColor = UIColor(named: "inActive")?.cgColor
        optionView.layer.cornerRadius = 10
        optionView.layer.shadowColor = UIColor.black.cgColor
        optionView.layer.shadowOffset = CGSizeMake(0, 5)
        optionView.backgroundColor = .white
        optionView.layer.shadowOpacity = 0.1
        optionView.layer.shadowRadius = 5

        imageView.frame = CGRect(x: -43, y: -40, width: 180, height: 126)
        optionView.addSubview(imageView)
        optionView.addSubview(optionTitle)

    }
    
    func setFrame (x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        optionView.frame = CGRect(x: x, y: y, width: width, height: height)

    }
    
    func setLbl (x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, text: String) {
        optionTitle.frame = CGRect(x: x, y: y, width: width, height: height)
        optionTitle.text = text
        optionTitle.font = UIFont(name: "SourceSansPro-Regular", size: 15)
        optionTitle.numberOfLines = 2
    }

    
    
    
}

