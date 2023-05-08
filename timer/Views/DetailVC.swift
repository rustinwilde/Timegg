//
//  DetailVC.swift
//  timer
//
//  Created by Rustin Wilde on 28.03.23.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    
    var imageView = UIImageView()
    
    @IBOutlet weak var startTimer: UIButton!
    
    @IBOutlet weak var boiledTypeLbl: UILabel!
    
    let isSecondTime = false
    
    let firstTempView = CustomView()
    let secondTempView = CustomView()
    
    let firstSizeView = CustomView()
    let secondSizeView = CustomView()
    let thirdSizeView = CustomView()
        
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var eggTitle: UILabel!
    
    let softView = UIView()
    let softBorder = UIView()
    let softImageView = UIImageView()
    let softTitle = UILabel()
    
    let mediumView = UIView()
    let mediumBorder = UIView()
    let mediumImageView = UIImageView()
    let mediumTitle = UILabel()
    
    let hardView = UIView()
    let hardBorder = UIView()
    let hardImageView = UIImageView()
    let hardTitle = UILabel()
    
    var selectedTime : Date = Date()
    
    var remainingTime : Int = 0
    var lastTimeOfFirstViews : Int = 0
    var lastTimeOfSecondViews : Int = 0
    var lastTimeOfThirdViews : Int = 0
    
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    
    lazy var labelTopFirstWord: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Set"
        label.textColor = .black
        label.font = UIFont(name: "SourceSansPro-Regular", size: 28)
        
        
        return label
    }()
    
    lazy var labelTopSecondWord: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "boiled details"
        label.textColor = .black
        label.font = UIFont(name: "SourceSansPro-SemiBold", size: 28)
        
        
        return label
    }()
    
    lazy var labelTopSubtitle: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Prepare eggs as you like!"
        label.textColor = .lightGray
        label.font = UIFont(name: "SourceSansPro-SemiBold", size: 15)
        
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Top View First Word Label's Constraints
        view.addSubview(labelTopFirstWord)
        labelTopFirstWord.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        labelTopFirstWord.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        labelTopFirstWord.topAnchor.constraint(equalTo: view.topAnchor, constant: 67).isActive = true
        
        //Top View Second Word Label's Constraints
        view.addSubview(labelTopSecondWord)
        
        labelTopSecondWord.leadingAnchor.constraint(equalTo: labelTopFirstWord.leadingAnchor, constant: 43).isActive = true
        labelTopSecondWord.topAnchor.constraint(equalTo: view.topAnchor, constant: 67).isActive = true
        
        //Top View Subtitle's Constraints
        view.addSubview(labelTopSubtitle)
        labelTopSubtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        labelTopSubtitle.topAnchor.constraint(equalTo: labelTopFirstWord.bottomAnchor, constant: 5).isActive = true
        
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 36) // Change the font size
        backButton.titleLabel?.font = UIFont(name: "SourceSansPro-Bold", size: 36) // Change the font
        
        forwardButton.titleLabel?.font = UIFont.systemFont(ofSize: 36) // Change the font size
        forwardButton.titleLabel?.font = UIFont(name: "SourceSansPro-Bold", size: 36) // Change the font
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        
        
        
        time.text = "00:00"
        
       
    }
    

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setGradientBackground()
        insertEggImage()
        
        //Temperature view
        
        
        //Egg Temperature View
        
        firstTempView.setupView()
        firstTempView.setupViewSize(x: 38, y: 275, width: 151, height: 53, widthAnchor: 151, heightAnchor: 53)
        firstTempView.setupLabelSize(x: 12, y: 17, width: 135, height: 19, text: "Fridge temperature")
        view.addSubview(firstTempView)
        
        secondTempView.setupView()
        secondTempView.setupViewSize(x: 214, y: 275, width: 151, height: 53, widthAnchor: 151, heightAnchor: 53)
        secondTempView.setupLabelSize(x: 12, y: 17, width: 135, height: 19, text: "Room temperature")
        view.addSubview(secondTempView)
        
        //Egg Size View
        
        firstSizeView.setupView()
        firstSizeView.setupViewSize(x: view.frame.width / 9, y: 413, width: 91, height: 53, widthAnchor: 91, heightAnchor: 53)
        firstSizeView.setupLabelSize(x: firstSizeView.frame.width/2 - 5, y: 17, width: 10, height: 19, text: "S")
        view.addSubview(firstSizeView)
        
        secondSizeView.setupView()
        secondSizeView.setupViewSize(x: firstSizeView.frame.maxX + 15, y: 413, width: 91, height: 53, widthAnchor: 91, heightAnchor: 53)
        secondSizeView.setupLabelSize(x: firstSizeView.frame.width/2 - 5, y: 17, width: 10, height: 19, text: "M")
        view.addSubview(secondSizeView)
        
        thirdSizeView.setupView()
        thirdSizeView.setupViewSize(x: secondSizeView.frame.maxX + 15, y: 413, width: 91, height: 53, widthAnchor: 91, heightAnchor: 53)
        thirdSizeView.setupLabelSize(x: firstSizeView.frame.width/2 - 5, y: 17, width: 10, height: 19, text: "L")
        view.addSubview(thirdSizeView)
        
        //Soft View
        softImageView.frame = softView.bounds
        softBorder.frame = softView.bounds
        softTitle.frame = CGRect(x: 11, y: 75, width: 65, height: 48)
        
        softView.frame = CGRect(x: 38, y: boiledTypeLbl.frame.maxY + 50, width: 91, height: 128)
        softImageView.image = UIImage(named: "Soft egg")
        softImageView.frame = CGRect(x: -39, y: -39, width: 170, height: 126)
        softTitle.numberOfLines = 2
        softTitle.text = "Soft boiled"
        softTitle.textColor = .lightGray
        softTitle.font = UIFont(name: "SourceSansPro-Regular", size: 15)
        softTitle.textAlignment = .center
        
        
        // Add the image view and border view to the container view
        softView.addSubview(softImageView)
        softView.addSubview(softBorder)
        softView.addSubview(softTitle)
        
        // Add the container view to your main view
        view.addSubview(softView)
        
        // Adjust the order of the views inside the container view
        softView.bringSubviewToFront(softImageView)
        softView.backgroundColor = UIColor.white
        
        
        // Set the shadow properties
        softView.layer.shadowColor = UIColor.black.cgColor
        softView.layer.shadowOpacity = 0.2
        softView.layer.shadowOffset = CGSize(width: 2, height: 2)
        softView.layer.shadowRadius = 5
        softView.layer.cornerRadius = 10
        
        
        //Medium View
        mediumImageView.frame = softView.bounds
        mediumBorder.frame = softView.bounds
        mediumTitle.frame = CGRect(x: 11, y: 75, width: 65, height: 48)
        
        mediumView.frame =  CGRect(x: softView.frame.maxX + 21, y: boiledTypeLbl.frame.maxY + 50, width: 91, height: 128)
        mediumImageView.image = UIImage(named: "Medium boiled")
        mediumImageView.frame = CGRect(x: -39, y: -39, width: 170, height: 126)
        mediumTitle.numberOfLines = 2
        mediumTitle.text = "Medium boiled"
        mediumTitle.textColor = .lightGray
        mediumTitle.font = UIFont(name: "SourceSansPro-Regular", size: 15)
        mediumTitle.textAlignment = .center
        
        
        // Add the image view and border view to the container view
        mediumView.addSubview(mediumImageView)
        mediumView.addSubview(mediumBorder)
        mediumView.addSubview(mediumTitle)
        
        // Add the container view to your main view
        view.addSubview(mediumView)
        
        // Adjust the order of the views inside the container view
        mediumView.bringSubviewToFront(mediumImageView)
        mediumView.backgroundColor = UIColor.white
        
        
        // Set the shadow properties
        mediumView.layer.shadowColor = UIColor.black.cgColor
        mediumView.layer.shadowOpacity = 0.2
        mediumView.layer.shadowOffset = CGSize(width: 2, height: 2)
        mediumView.layer.shadowRadius = 5
        mediumView.layer.cornerRadius = 10
        
        
        
        //Hard View
        hardImageView.frame = softView.bounds
        hardBorder.frame = softView.bounds
        hardTitle.frame = CGRect(x: 11, y: 75, width: 65, height: 48)
        
        hardView.frame = CGRect(x: mediumView.frame.maxX + 21, y: thirdSizeView.frame.maxY + 97, width: 91, height: 128)
        hardImageView.image = UIImage(named: "Hard boiled")
        hardImageView.frame = CGRect(x: -39, y: -39, width: 170, height: 126)
        hardTitle.numberOfLines = 2
        hardTitle.text = "Hard boiled"
        hardTitle.textColor = .lightGray
        hardTitle.font = UIFont(name: "SourceSansPro-Regular", size: 15)
        hardTitle.textAlignment = .center
        
        
        // Add the image view and border view to the container view
        hardView.addSubview(hardImageView)
        hardView.addSubview(hardBorder)
        hardView.addSubview(hardTitle)
        
        // Add the container view to your main view
        view.addSubview(hardView)
        
        // Adjust the order of the views inside the container view
        hardView.bringSubviewToFront(hardImageView)
        hardView.backgroundColor = UIColor.white
        
        
        // Set the shadow properties
        hardView.layer.shadowColor = UIColor.black.cgColor
        hardView.layer.shadowOpacity = 0.2
        hardView.layer.shadowOffset = CGSize(width: 2, height: 2)
        hardView.layer.shadowRadius = 5
        hardView.layer.cornerRadius = 10
        
 
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addTapGestureToViews()
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? TimerVC {
            destinationVC.timerLabel.text = time.text ?? ""
        }
        
    }
    
    
    
    func addTapGestureToViews() {
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(chooseTemp))
        firstTempView.tag = 60
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(chooseTemp))
        secondTempView.tag = 40
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(chooseSize))
        firstSizeView.tag = 20
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(chooseSize))
        secondSizeView.tag = 35
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(chooseSize))
        thirdSizeView.tag = 50
        
        let tapGesture6 = UITapGestureRecognizer(target: self, action: #selector(chooseType))
        softView.tag = 210
        let tapGesture7 = UITapGestureRecognizer(target: self, action: #selector(chooseType))
        mediumView.tag = 300
        let tapGesture8 = UITapGestureRecognizer(target: self, action: #selector(chooseType))
        hardView.tag = 480
        
        firstTempView.addGestureRecognizer(tapGesture1)
        secondTempView.addGestureRecognizer(tapGesture2)
        
        firstSizeView.addGestureRecognizer(tapGesture3)
        secondSizeView.addGestureRecognizer(tapGesture4)
        thirdSizeView.addGestureRecognizer(tapGesture5)
        
        softView.addGestureRecognizer(tapGesture6)
        mediumView.addGestureRecognizer(tapGesture7)
        hardView.addGestureRecognizer(tapGesture8)
        
    }
    
    
    @objc func chooseTemp(_ sender: UITapGestureRecognizer) {
        
        if sender.view == firstTempView {
            
            firstTempView.optionTapped()
            secondTempView.viewOriginalState()
            print("Fridge temperature")
            if let duration = sender.view?.tag{
                remainingTime = duration
                print("D",duration)
                updateTimeLabel()
            }
            
        } else {
            secondTempView.optionTapped()
            firstTempView.viewOriginalState()
            print("Room temperature")
            if let duration = sender.view?.tag{
                remainingTime = duration
                updateTimeLabel()
            }
        }
        lastTimeOfFirstViews = remainingTime
        finalTimeLabel(lastTime: lastTimeOfFirstViews)
    }
    
    @objc func chooseSize(_ sender: UITapGestureRecognizer) {
        if sender.view == firstSizeView {
            firstSizeView.optionTapped()
            secondSizeView.viewOriginalState()
            thirdSizeView.viewOriginalState()
            if let duration = sender.view?.tag{
                remainingTime = duration
                updateTimeLabel()
            }
            print("S")
        } else if sender.view == secondSizeView {
            secondSizeView.optionTapped()
            firstSizeView.viewOriginalState()
            thirdSizeView.viewOriginalState()
            if let duration = sender.view?.tag{
                remainingTime = duration
                updateTimeLabel()
            }
            print("M")
        } else if sender.view == thirdSizeView {
            thirdSizeView.optionTapped()
            firstSizeView.viewOriginalState()
            secondSizeView.viewOriginalState()
            if let duration = sender.view?.tag{
                remainingTime = duration
                updateTimeLabel()
            }
            print("L")
        }
        lastTimeOfSecondViews = lastTimeOfFirstViews + remainingTime
        finalTimeLabel(lastTime: lastTimeOfSecondViews)
        
    }
    
    @objc func chooseType(_ sender: UITapGestureRecognizer) {
        if sender.view == softView{
            softBorder.layer.borderColor = UIColor(named: "active")?.cgColor
            softView.layer.borderColor = UIColor(named: "active")?.cgColor
            softImageView.superview?.bringSubviewToFront(softImageView)
            softTitle.textColor = UIColor(named: "active")
            softTitle.font = UIFont(name: "SourceSansPro-Bold", size: 15.0)
            softView.layer.zPosition = 0
            softBorder.layer.zPosition = 1
            softImageView.layer.zPosition = 2
            
            time.font = UIFont(name: "SourceSansPro-Bold", size: 21.0)
            
            mediumBorder.layer.borderColor = UIColor(named: "inActive")?.cgColor
            mediumView.layer.borderColor = UIColor(named: "inActive")?.cgColor
            mediumImageView.superview?.bringSubviewToFront(mediumImageView)
            mediumView.layer.zPosition = 0
            mediumBorder.layer.zPosition = 1
            mediumImageView.layer.zPosition = 2
            mediumView.layer.cornerRadius = 10
            mediumView.layer.borderWidth = 1.0
            mediumTitle.font = UIFont(name: "SourceSansPro-Regular", size: 15)
            mediumTitle.textColor = .lightGray
            mediumView.bringSubviewToFront(softImageView)
            mediumImageView.sendSubviewToBack(softBorder)
            
            
            
            hardBorder.layer.borderColor = UIColor(named: "inActive")?.cgColor
            hardView.layer.borderColor = UIColor(named: "inActive")?.cgColor
            hardImageView.superview?.bringSubviewToFront(hardImageView)
            hardView.layer.zPosition = 0
            hardBorder.layer.zPosition = 1
            hardImageView.layer.zPosition = 2
            hardView.layer.cornerRadius = 10
            hardView.layer.borderWidth = 1.0
            hardTitle.font = UIFont(name: "SourceSansPro-Regular", size: 15)
            hardTitle.textColor = .lightGray
            hardView.bringSubviewToFront(softImageView)
            hardImageView.sendSubviewToBack(softBorder)
            
            if let duration = sender.view?.tag{
                remainingTime = duration
                updateTimeLabel()
                print(remainingTime)
                print("D",duration)
            }
            
        }
        
        else if sender.view == mediumView {
            mediumBorder.layer.borderColor = UIColor(named: "active")?.cgColor
            mediumView.layer.borderColor = UIColor(named: "active")?.cgColor
            mediumImageView.superview?.bringSubviewToFront(mediumImageView)
            mediumTitle.textColor = UIColor(named: "active")
            mediumTitle.font = UIFont(name: "SourceSansPro-Bold", size: 15.0)
            time.font = UIFont(name: "SourceSansPro-Bold", size: 21.0)
            
            
            
            softBorder.layer.borderColor = UIColor(named: "inActive")?.cgColor
            softView.layer.borderColor = UIColor(named: "inActive")?.cgColor
            softImageView.superview?.bringSubviewToFront(softImageView)
            softView.layer.cornerRadius = 10
            softView.layer.borderWidth = 1.0
            softTitle.font = UIFont(name: "SourceSansPro-Regular", size: 15)
            softTitle.textColor = .lightGray
            
            
            hardBorder.layer.borderColor = UIColor(named: "inActive")?.cgColor
            hardView.layer.borderColor = UIColor(named: "inActive")?.cgColor
            hardImageView.superview?.bringSubviewToFront(hardImageView)
            hardView.layer.cornerRadius = 10
            hardView.layer.borderWidth = 1.0
            hardTitle.font = UIFont(name: "SourceSansPro-Regular", size: 15)
            hardTitle.textColor = .lightGray
            
            if let duration = sender.view?.tag{
                remainingTime = duration
                updateTimeLabel()
            }
            
        } else if sender.view == hardView {
            hardBorder.layer.borderColor = UIColor(named: "active")?.cgColor
            hardView.layer.borderColor = UIColor(named: "active")?.cgColor
            hardImageView.superview?.bringSubviewToFront(hardImageView)
            hardTitle.textColor = UIColor(named: "active")
            hardTitle.font = UIFont(name: "SourceSansPro-Bold", size: 15.0)
            time.font = UIFont(name: "SourceSansPro-Bold", size: 21.0)
            
            softBorder.layer.borderColor = UIColor(named: "inActive")?.cgColor
            softView.layer.borderColor = UIColor(named: "inActive")?.cgColor
            softImageView.superview?.bringSubviewToFront(softImageView)
            softView.layer.cornerRadius = 10
            softView.layer.borderWidth = 1.0
            softTitle.font = UIFont(name: "SourceSansPro-Regular", size: 15)
            softTitle.textColor = .lightGray
            
            
            
            mediumBorder.layer.borderColor = UIColor(named: "inActive")?.cgColor
            mediumView.layer.borderColor = UIColor(named: "inActive")?.cgColor
            mediumImageView.superview?.bringSubviewToFront(mediumImageView)
            mediumView.layer.cornerRadius = 10
            mediumView.layer.borderWidth = 1.0
            mediumTitle.font = UIFont(name: "SourceSansPro-Regular", size: 15)
            mediumTitle.textColor = .lightGray
            
            if let duration = sender.view?.tag{
                remainingTime = duration
                updateTimeLabel()
            }
        }
        
        lastTimeOfThirdViews = lastTimeOfSecondViews + remainingTime
        finalTimeLabel(lastTime: lastTimeOfThirdViews)
        
    }
    
    @IBAction func backToPreviousScreen(segue: UIStoryboardSegue) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func startTimer(_ sender: Any) {
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "goToTimerVC") as? TimerVC {
            destinationVC.timerLabel.text = time.text ?? ""
            time.text = destinationVC.boilTime.text ?? "No value"
        }
    }
    
  
        func setGradientBackground() {
            let gradientLayer:CAGradientLayer = CAGradientLayer()
            gradientLayer.frame.size = self.topView.frame.size
            gradientLayer.colors =
            [UIColor.white.cgColor,UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0).cgColor]
            //Use diffrent colors
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
            topView.layer.addSublayer(gradientLayer)
        }
        
        func insertEggImage() {
            let imageView = UIImageView(image: UIImage(named: "egg"))
            imageView.frame = CGRect(x: 310, y: 23, width: 155, height: 185)
            
            self.topView.addSubview(imageView)
            
        }
        
        func topViewLbl() {
            labelTopFirstWord = UILabel(frame: CGRect(x: 35, y: 47, width: self.labelTopFirstWord.frame.width, height: self.labelTopFirstWord.frame.height))
            labelTopFirstWord.textColor = .black
            labelTopFirstWord.font = UIFont.systemFont(ofSize: 17)
            labelTopFirstWord.text = "Set boiled details"
            self.topView.addSubview(labelTopFirstWord)
        }
        
        func updateTimeLabel() {
            let minutes = remainingTime / 60
            let seconds = remainingTime % 60
            time.text = String(format: "%02d:%02d", minutes, seconds)

        }
        
        func finalTimeLabel(lastTime: Int) {
            let minutes = lastTime / 60
            let seconds = lastTime % 60
            time.text = String(format: "%02d:%02d", minutes, seconds)
        }
        
    }


