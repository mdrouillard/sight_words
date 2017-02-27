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
     
        answerButton1.setTitle("a", for: .normal)
        answerButton2.setTitle("and", for: .normal)
        answerButton3.setTitle("away", for: .normal)
        answerButton4.setTitle("big", for: .normal)

        
    }

    
    func counter() {
        seconds -= 1
        timerLabel.text = String(seconds)
        
        if seconds == 0 {
            timer.invalidate()
        }
        
        // Word lists
        var kWords : [String] = ["a", "and", "away", "big", "blue", "can", "come", "down", "find", "for", "funny", "go", "help", "here", "I", "in", "is", "it", "jump", "little", "look", "make", "me", "my", "not", "one", "play", "red", "run", "said", "see", "the", "three", "to", "two", "up", "we", "where", "yellow", "you"]
        
        // Count the words in the array
        var wordsList = kWords.count
        //print(wordsList)
        var currentWord = kWords[0]
       //  print(currentWord)
        
        
        
        // Check to see if there are words left in the list
        let wordsLeft : Bool
        if wordsList > 0 {
            wordsLeft = true
        } else {
            wordsLeft = false
        }
        
        
        // As long as there are words on the list, show the first one in the text label.
        
        if wordsLeft == true {
    //       print(currentWord)
            sightWordText.text = currentWord
        }
        
        // Set up an array and variables to hold the answers
        var answerWords = [String]()
        let numberOfButtons = 4
        var buttonsWithWords = 0
        
        func generateAnswers(){
            // generate a random index placement for correct answer and insert it
            while buttonsWithWords < numberOfButtons {
                let randomIndex = Int(arc4random_uniform(UInt32(wordsList)))
                answerWords.append(kWords[randomIndex])
                buttonsWithWords += 1
            }
            // insert the correct answer at a random index of the array
            let answerIndex = Int(arc4random_uniform(UInt32(4)))
            answerWords.insert(currentWord, at: answerIndex)
            // populate the buttons
            answerButton1.setTitle(answerWords[0], for: .normal)
            answerButton2.setTitle(answerWords[1], for: .normal)
            answerButton3.setTitle(answerWords[2], for: .normal)
            answerButton4.setTitle(answerWords[3], for: .normal)

        }

   }
    
    
}
