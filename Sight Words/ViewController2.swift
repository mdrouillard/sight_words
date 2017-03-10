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
   
    var seconds = 60
    var timer = Timer()
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    // text fields
    @IBOutlet weak var sightWordText: UILabel!
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
        sightWordText.text = sharedWordManager.currentAnswer
        sharedWordManager.getAnswers()
        scoreLabel.text = String(0)
        
        // read the word
        myUtterance = AVSpeechUtterance(string: sharedWordManager.currentAnswer)
        synth.speak(myUtterance)
        
       
        print("This should be the list \(sharedWordManager.wordChoices)")
        button1.setTitle(sharedWordManager.wordChoices[0], for: .normal)
        button2.setTitle(sharedWordManager.wordChoices[1], for: .normal)
        button3.setTitle(sharedWordManager.wordChoices[2], for: .normal)
        button4.setTitle(sharedWordManager.wordChoices[3], for: .normal)
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
    
    
    
    func resetWords() {
        sharedWordManager.getAnswers()
        print(sharedWordManager.wordChoices)
        sightWordText.text = sharedWordManager.currentAnswer
        scoreLabel.text = String(sharedWordManager.score)
        print(sightWordText)
        button1.setTitle(sharedWordManager.wordChoices[0], for: .normal)
        button2.setTitle(sharedWordManager.wordChoices[1], for: .normal)
        button3.setTitle(sharedWordManager.wordChoices[2], for: .normal)
        button4.setTitle(sharedWordManager.wordChoices[3], for: .normal)
    }
    
    @IBAction func readWord(_ sender: UIButton) {
        myUtterance = AVSpeechUtterance(string: sharedWordManager.currentAnswer)
        synth.speak(myUtterance)
        
    }
    @IBAction func answerButton1(_ sender: UIButton) {
        sharedWordManager.answerKey(correct: sharedWordManager.currentAnswer, guess: button1.currentTitle!)
        resetWords()
        myUtterance = AVSpeechUtterance(string: sharedWordManager.currentAnswer)
        synth.speak(myUtterance)
    }
    @IBAction func answerButton2(_ sender: UIButton) {
        sharedWordManager.answerKey(correct: sharedWordManager.currentAnswer, guess: button2.currentTitle!)
        resetWords()
        myUtterance = AVSpeechUtterance(string: sharedWordManager.currentAnswer)
        synth.speak(myUtterance)

    }
    
    @IBAction func answerButton3(_ sender: UIButton) {
        sharedWordManager.answerKey(correct: sharedWordManager.currentAnswer, guess: button3.currentTitle!)
        resetWords()
        myUtterance = AVSpeechUtterance(string: sharedWordManager.currentAnswer)
        synth.speak(myUtterance)

    }
    
    @IBAction func answerButton4(_ sender: UIButton) {
        sharedWordManager.answerKey(correct: sharedWordManager.currentAnswer, guess: button4.currentTitle!)
        resetWords()
        myUtterance = AVSpeechUtterance(string: sharedWordManager.currentAnswer)
        synth.speak(myUtterance)

    }
    
}
