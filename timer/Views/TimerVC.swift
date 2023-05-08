//
//  TimerVC.swift
//  timer
//
//  Created by Rustin Wilde on 29.04.23.
//

import UIKit

class TimerVC : UIViewController {
    
    var timer : Timer?
    let shapeLayer = CAShapeLayer()
    var duration: Int = 0
    
    @IBOutlet weak var boiledTimeLbl: UILabel!
    
  //  @IBOutlet weak var boilTime: UILabel!
    
    
    
    let shapeView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Timer A4 test 4")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var timerLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "SourceSansPro-Bold", size: 44)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeMINLabel : UILabel = {
        let label = UILabel()
        label.text = "MIN"
        label.font = UIFont(name: "SourceSansPro-SemiBold", size: 13)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let boilTime : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "SourceSansPro-Bold", size: 17)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let boilTimeMINLabel : UILabel = {
        let label = UILabel()
        label.text = "MIN"
        label.font = UIFont(name: "SourceSansPro-Bold", size: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConstraints()

        
        timerLabel.font = UIFont(name: "SourceSansPro-Bold", size: 44)
        
        if let time = timerLabel.text {
                let components = time.components(separatedBy: ":")
                let minutes = Int(components[0]) ?? 0
                let seconds = Int(components[1]) ?? 0
                let totalTime = minutes * 60 + seconds
                startTimer(totalTime: totalTime)
            }
        basicAnimation()
        boilTime.text = timerLabel.text
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let imageView = UIImageView(image: UIImage(named: ""))
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: -15, y: 19, width: 374, height: 381) // set the frame as per your requirement
        let circularTimerView = CustomTimer(frame: shapeView.frame)
        shapeView.addSubview(circularTimerView)
        view.addSubview(imageView)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.animationCircular()


    }
    
    @IBAction func barButtonItemTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    

   
    
    func startTimer(totalTime: Int) {

        duration = totalTime
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
            
            if duration > 0 {
                duration -= 1
                let minutes = duration / 60
                let seconds = duration % 60
                self.timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
                
            } else if duration == 0 {
                self.timer?.invalidate()
            }
        }
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        timer?.invalidate()
        shapeLayer.removeAnimation(forKey: "basicAnimation")
    }
    
    
    //Animation
    
    func animationCircular() {
        
        let center = CGPoint(x: shapeView.frame.width/2 + 15, y: shapeView.frame.height/2 + 4)
        let endAngle = (-CGFloat.pi / 2)
        
        let startAngle = 2 * CGFloat.pi + endAngle
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 140.5, startAngle: startAngle, endAngle: endAngle, clockwise: false)
    

        shapeLayer.path = circularPath.cgPath
        shapeLayer.lineWidth = 14
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 1
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeColor = UIColor(named: "Color")?.cgColor
        shapeView.layer.addSublayer(shapeLayer)
    }
    
    func basicAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 0
        basicAnimation.duration = CFTimeInterval(duration)
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
    
}

extension TimerVC {
    func setConstraints() {
            
            view.addSubview(shapeView)
            NSLayoutConstraint.activate([
                shapeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 113),
                shapeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -90),
                shapeView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 66),
                shapeView.heightAnchor.constraint(equalToConstant: 381),
                shapeView.widthAnchor.constraint(equalToConstant: 404)
                
            ])
            
            shapeView.addSubview(timerLabel)
            NSLayoutConstraint.activate([
                timerLabel.topAnchor.constraint(equalTo: shapeView.topAnchor, constant: 104),
                timerLabel.leadingAnchor.constraint(equalTo: shapeView.leadingAnchor, constant: 155),
                timerLabel.rightAnchor.constraint(equalTo: shapeView.rightAnchor, constant: -127),
                timerLabel.widthAnchor.constraint(equalToConstant: 120)
            ])
        
            timerLabel.addSubview(timeMINLabel)
            NSLayoutConstraint.activate([
                timeMINLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 245),
                timeMINLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 75),
                timeMINLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 65)

            ])
        
        view.addSubview(boilTime)
        NSLayoutConstraint.activate([
            boilTime.topAnchor.constraint(equalTo: shapeView.bottomAnchor, constant: 15),
            boilTime.leadingAnchor.constraint(equalTo: boiledTimeLbl.leadingAnchor, constant: 185),
            boilTime.heightAnchor.constraint(equalToConstant: 21),
            boilTime.widthAnchor.constraint(equalToConstant: 73)
        ])
        
        view.addSubview(boilTimeMINLabel)
        NSLayoutConstraint.activate([
            boilTimeMINLabel.topAnchor.constraint(equalTo: shapeView.bottomAnchor, constant: 17),
            boilTimeMINLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
            boilTimeMINLabel.heightAnchor.constraint(equalToConstant: 21),
            boilTimeMINLabel.widthAnchor.constraint(equalToConstant: 30)
        ])
            }
    
   
}
