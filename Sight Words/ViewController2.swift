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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController2.counter), userInfo: nil, repeats: true)
        
    }
    
    @IBOutlet weak var sightWordText: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
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
        print(wordsList)
        var currentWord = kWords[0]
        print(currentWord)
        
        
        // Check to see if there are words left in the list
        let wordsLeft : Bool
        if wordsList > 0 {
            wordsLeft = true
        } else {
            wordsLeft = false
        }
        
        
        // As long as there are words on the list, show the first one in the text label
        
        for kWord in kWords {
            if wordsLeft == true {
                print(currentWord)
                sightWordText.text = currentWord
                
            }
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
