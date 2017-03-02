//
//  ViewController2.swift
//  Sight Words
//
//  Created by Mark Drouillard on 2/19/17.
//  Copyright © 2017 Mark Drouillard. All rights reserved.
//

import UIKit


var seconds = 60
var timer = Timer()

// for debugging
var correctWord = "a"

class ViewController2: UIViewController {
   
    // text fields
    @IBOutlet weak var sightWordText: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    // buttons
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // start the timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController2.counter), userInfo: nil, repeats: true)
     
        answerButton1.setTitle("away", for: .normal)
        answerButton2.setTitle("and", for: .normal)
        answerButton3.setTitle("a", for: .normal)
        answerButton4.setTitle("big", for: .normal)

        
    }

    
    func counter() {
        seconds -= 1
        timerLabel.text = String(seconds)
        
        if seconds == 0 {
            timer.invalidate()
        } else {
            return
        }
    }
    
    
    @IBAction func buttonOneAction(_ sender: UIButton) {
        // if correct, get new word, get new answers, remove correct word from array, add to timer, add to score
        if answerButton1.titleLabel?.text == correctWord {
            print("Correct!")
            
            
        } else {
            print("Wrong!")
        }
    }
    
    @IBAction func buttonTwoAction(_ sender: UIButton) {
        if answerButton2.titleLabel?.text == correctWord {
            print("Correct!")
        } else {
            print("Wrong!")
        }

        
    }
    
    @IBAction func buttonThreeAction(_ sender: UIButton) {
        if answerButton3.titleLabel?.text == correctWord {
            print("Correct!")
        } else {
            print("Wrong!")
        }

    }
    
    @IBAction func buttonFourAction(_ sender: UIButton) {
        if answerButton4.titleLabel?.text == correctWord {
            print("Correct!")
        } else {
            print("Wrong!")
        }

    }
}

