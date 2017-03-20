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
    static let shared = ViewController2()
   
    var timer = Timer()
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    // text fields
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    
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
        WordManager.shared.chooseList()
        WordManager.shared.setSightAnswer()
        WordManager.shared.defineWordLevels()
        WordManager.shared.getAnswers()
        scoreLabel.text = String(0)
        
        // read the word
        sayWord()
        
       
        print("This should be the list \(WordManager.shared.wordChoices)")
        button1.setTitle(WordManager.shared.wordChoices[0], for: .normal)
        button2.setTitle(WordManager.shared.wordChoices[1], for: .normal)
        button3.setTitle(WordManager.shared.wordChoices[2], for: .normal)
        button4.setTitle(WordManager.shared.wordChoices[3], for: .normal)
    }

    
    func counter() {
        WordManager.shared.seconds -= 1
        timerLabel.text = String(WordManager.shared.seconds)
        
        if WordManager.shared.seconds <= 0 {
            timer.invalidate()
            ScoreManager.shared.calculateAchievedLevel()
            self.performSegue(withIdentifier: "gameOver", sender: nil)
        } else {
            return
        }
    }
    
    
    
    func resetWords() {
        WordManager.shared.getAnswers()
        print(WordManager.shared.wordChoices)
        scoreLabel.text = String(WordManager.shared.score)
        button1.setTitle(WordManager.shared.wordChoices[0], for: .normal)
        button2.setTitle(WordManager.shared.wordChoices[1], for: .normal)
        button3.setTitle(WordManager.shared.wordChoices[2], for: .normal)
        button4.setTitle(WordManager.shared.wordChoices[3], for: .normal)
    }
    
    
    func sayWord() {
        myUtterance = AVSpeechUtterance(string: WordManager.shared.currentAnswer)
        myUtterance.rate = 0.5
        myUtterance.preUtteranceDelay = 0.25
        synth.speak(myUtterance)
    }
    

    
    func gameWon() {
        if WordManager.shared.listCount > 4 {
            ScoreManager.shared.calculateAchievedLevel()
            self.performSegue(withIdentifier: "gameOver", sender: nil)
        }
        else {
            return
        }
    }
    
    @IBAction func readWord(_ sender: UIButton) {
        sayWord()
        
    }
    
    @IBAction func answerButton1(_ sender: UIButton) {
    
        WordManager.shared.answerKey(correct: WordManager.shared.currentAnswer, guess: button1.currentTitle!)
        gameWon()
        resetWords()
        sayWord()
        ScoreManager.shared.calculateAchievedLevel()
        levelLabel.text = ScoreManager.shared.childAchievedLevel
       
    }
    @IBAction func answerButton2(_ sender: UIButton) {
        WordManager.shared.answerKey(correct: WordManager.shared.currentAnswer, guess: button2.currentTitle!)
        gameWon()
        resetWords()
        sayWord()
        ScoreManager.shared.calculateAchievedLevel()
        levelLabel.text = ScoreManager.shared.childAchievedLevel

       
    }
    
    @IBAction func answerButton3(_ sender: UIButton) {
        WordManager.shared.answerKey(correct: WordManager.shared.currentAnswer, guess: button3.currentTitle!)
        gameWon()
        resetWords()
        sayWord()
        ScoreManager.shared.calculateAchievedLevel()
        levelLabel.text = ScoreManager.shared.childAchievedLevel

    }
    
    @IBAction func answerButton4(_ sender: UIButton) {
        WordManager.shared.answerKey(correct: WordManager.shared.currentAnswer, guess: button4.currentTitle!)
        gameWon()
        resetWords()
        sayWord()
        ScoreManager.shared.calculateAchievedLevel()
        levelLabel.text = ScoreManager.shared.childAchievedLevel
        
    }
    
}
