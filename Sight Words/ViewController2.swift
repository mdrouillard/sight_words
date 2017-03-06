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
        WordManager().chooseList()
        sightWordText.text = WordManager().currentAnswer
        WordManager().getAnswers()
        
        // read the word
        myUtterance = AVSpeechUtterance(string: WordManager().currentAnswer)
        synth.speak(myUtterance)
        
       
        print("This should be the list \(WordManager().wordChoices)")
        button1.setTitle("a", for: .normal)
        button2.setTitle("and", for: .normal)
        button3.setTitle("away", for: .normal)
        button4.setTitle("big", for: .normal)
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
        WordManager().getAnswers()
        print(WordManager().currentList)
        print("Words to work on \(WordManager().wordsToWorkOn)")
 /*     button1.setTitle(WordManager().wordChoices[0], for: .normal)
        button2.setTitle(WordManager().wordChoices[1], for: .normal)
        button3.setTitle(WordManager().wordChoices[2], for: .normal)
        button4.setTitle(WordManager().wordChoices[3], for: .normal) */
    }
    
    @IBAction func readWord(_ sender: UIButton) {
        myUtterance = AVSpeechUtterance(string: WordManager().currentAnswer)
        synth.speak(myUtterance)
        
    }
    @IBAction func answerButton1(_ sender: UIButton) {
        WordManager().answerKey(correct: WordManager().currentAnswer, guess: button1.currentTitle!)
        resetWords()
        
    }
    @IBAction func answerButton2(_ sender: UIButton) {
        WordManager().answerKey(correct: WordManager().currentAnswer, guess: button2.currentTitle!)
        resetWords()

    }
    
    @IBAction func answerButton3(_ sender: UIButton) {
        WordManager().answerKey(correct: WordManager().currentAnswer, guess: button3.currentTitle!)
        resetWords()

    }
    
    @IBAction func answerButton4(_ sender: UIButton) {
        WordManager().answerKey(correct: WordManager().currentAnswer, guess: button4.currentTitle!)
        resetWords()

    }
    
}
