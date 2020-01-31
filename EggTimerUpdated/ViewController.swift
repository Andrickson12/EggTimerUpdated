//
//  ViewController.swift
//  EggTimerUpdated
//
//  Created by Andrickson Coste on 1/20/20.
//  Copyright © 2020 Andrickson Coste. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var softButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    @IBOutlet weak var eggCookingProgress: UIProgressView!
    @IBOutlet weak var doneText: UILabel!
    @IBOutlet weak var eggImages: UIImageView!
    
    
    //Properties
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0

    
    //Dictionary
    var dic = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UIProperties()
        
        
    }
    
    //Declare it outside to use it globally(this can be use inside "hardnessPressed" but will limit the scope just inside "hardnessPressed" aka only use the property inside "hardnessPressed")
    var hardness = ""
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        
        //progressbar stops
        timer.invalidate()
        
        //Assign button title to variable hardness
        self.hardness = sender.currentTitle!
        
        //Put button titles inside the dictionary and assign it to the variable secondsRemaining
        totalTime = dic[hardness]!
        
        //MAke progress go back to 0
        eggCookingProgress.progress = 0.0
        secondsPassed = 0
        //doneText.text = hardness
        
        //Show picture depending on the button with animation
        if sender.currentTitle == "Soft" {
            eggImages.image = UIImage(named: "soft_egg.png")
            UIView.transition(with: eggImages, duration: 0.75, options: .transitionCrossDissolve, animations: {
                self.eggImages.image = self.eggImages.image
            }, completion: nil)
        }
        else if sender.currentTitle == "Medium" {
            eggImages.image = UIImage(named: "medium_egg.png")
            UIView.transition(with: eggImages, duration: 0.75, options: .transitionCrossDissolve, animations: {
                self.eggImages.image = self.eggImages.image
            }, completion: nil)
        }
        else if sender.currentTitle == "Hard" {
            eggImages.image = UIImage(named: "hard_egg.png")
            UIView.transition(with: eggImages, duration: 0.75, options: .transitionCrossDissolve, animations: {
                self.eggImages.image = self.eggImages.image
            }, completion: nil)
        }
        
        //timer syntax
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    //Update function
    @objc func updateCounter(){
        
        if secondsPassed < totalTime {
            
            //increase secondsPassed by 1
            secondsPassed += 1
            
            //divide Float(secondPassed) / Float(totalTime)
            eggCookingProgress.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            
            //Time stops
            timer.invalidate()
            
            //Label show done
            doneText.text = "Your \(hardness) egg is Done!"
        }
    }
    
    func UIProperties() {
        
        softButton.layer.cornerRadius = 23
        softButton.layer.borderWidth = 2
        softButton.layer.borderColor = UIColor.white.cgColor
        
        mediumButton.layer.cornerRadius = 23
        mediumButton.layer.borderWidth = 2
        mediumButton.layer.borderColor = UIColor.white.cgColor
        
        hardButton.layer.cornerRadius = 23
        hardButton.layer.borderWidth = 2
        hardButton.layer.borderColor = UIColor.white.cgColor
        
        //Progress bar properties custom
        eggCookingProgress.tintColor = UIColor.white
        eggCookingProgress.transform = eggCookingProgress.transform.scaledBy(x: 1, y: 2)
    }
    
}

