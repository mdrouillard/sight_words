//
//  ViewController2.swift
//  Sight Words
//
//  Created by Mark Drouillard on 2/19/17.
//  Copyright © 2017 Mark Drouillard. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController2: UIViewController {
   
    var timer = Timer()
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    // text fields
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // buttons
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // start the timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController2.counter), userInfo: nil, repeats: true)
        
        // set the first sight word and answers
        sharedWordManager.chooseList()
        sharedWordManager.setSightAnswer()
        sharedWordManager.getAnswers()
        scoreLabel.text = String(0)
        
        // read the word
        sayWord()
        
       
        print("This should be the list \(sharedWordManager.wordChoices)")
        button1.setTitle(sharedWordManager.wordChoices[0], for: .normal)
        button2.setTitle(sharedWordManager.wordChoices[1], for: .normal)
        button3.setTitle(sharedWordManager.wordChoices[2], for: .normal)
        button4.setTitle(sharedWordManager.wordChoices[3], for: .normal)
    }

    
    func counter() {
        sharedWordManager.seconds -= 1
        timerLabel.text = String(sharedWordManager.seconds)
        
        if sharedWordManager.seconds == 0 {
            timer.invalidate()
            self.performSegue(withIdentifier: "gameOver", sender: nil)
        } else {
            return
        }
    }
    
    
    
    func resetWords() {
        sharedWordManager.getAnswers()
        print(sharedWordManager.wordChoices)
        scoreLabel.text = String(sharedWordManager.score)
        button1.setTitle(sharedWordManager.wordChoices[0], for: .normal)
        button2.setTitle(sharedWordManager.wordChoices[1], for: .normal)
        button3.setTitle(sharedWordManager.wordChoices[2], for: .normal)
        button4.setTitle(sharedWordManager.wordChoices[3], for: .normal)
    }
    
    
    func sayWord() {
        myUtterance = AVSpeechUtterance(string: sharedWordManager.currentAnswer)
        myUtterance.rate = 0.5
        myUtterance.preUtteranceDelay = 0.25
        synth.speak(myUtterance)
    }
    
    @IBAction func readWord(_ sender: UIButton) {
        sayWord()
        
    }
    
    @IBAction func answerButton1(_ sender: UIButton) {
    
        sharedWordManager.answerKey(correct: sharedWordManager.currentAnswer, guess: button1.currentTitle!)
        resetWords()
        sayWord()
       
    }
    @IBAction func answerButton2(_ sender: UIButton) {
        sharedWordManager.answerKey(correct: sharedWordManager.currentAnswer, guess: button2.currentTitle!)
        resetWords()
        sayWord()

       
    }
    
    @IBAction func answerButton3(_ sender: UIButton) {
        sharedWordManager.answerKey(correct: sharedWordManager.currentAnswer, guess: button3.currentTitle!)
        resetWords()
        sayWord()

    }
    
    @IBAction func answerButton4(_ sender: UIButton) {
        sharedWordManager.answerKey(correct: sharedWordManager.currentAnswer, guess: button4.currentTitle!)
        resetWords()
        sayWord()
        
        
    }
    
}
