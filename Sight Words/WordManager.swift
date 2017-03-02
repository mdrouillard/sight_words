//
//  WordManager.swift
//  Sight Words
//
//  Created by Mark Drouillard on 3/2/17.
//  Copyright © 2017 Mark Drouillard. All rights reserved.
//

import Foundation

import UIKit
// Word lists
var preWords : [String] = ["a", "and", "away", "big", "blue", "can", "come", "down", "find", "for", "funny", "go", "help", "here", "I", "in", "is", "it", "jump", "little", "look", "make", "me", "my", "not", "one", "play", "red", "run", "said", "see", "the", "three", "to", "two", "up", "we", "where", "yellow", "you"]

var kWords : [String] = ["all", "am", "are", "at", "ate", "be", "black", "brown", "but", "came", "did", "do", "eat", "four", "get", "good", "have", "he", "into", "like", "must", "new", "no", "now", "on", "our", "out", "please", "pretty", "ran", "ride", "saw", "say", "she", "so", "soon", "that", "there", "they", "this", "too", "under", "want", "was", "well", "went", "what", "white", "who", "will", "with", "yes"]

var firstWords: [String] = ["after", "again", "an", "any", "as", "ask", "by", "could", "every", "fly", "from", "give", "going", "had", "has", "her", "him", "his", "how", "just", "know", "let", "live", "may", "of", "old", "once", "open", "over", "put", "round", "some", "stop", "take", "thank", "them", "then", "think", "walk", "were", "when"]

var correctWords: [String] = []



func getLists() {
    // check to see if there are words left in the list and if not, check the next, and set the active list
    var currentList = preWords
    
    if preWords.count > 0 {
        currentList = preWords
    } else if preWords.count == 0 {
        currentList = kWords
    }
    else if currentList.count == 0 {
        currentList = firstWords
    } else {
        print("You win!")
    }
    print(currentList)
    
}

func randomWord() {
    let allWords = preWords + kWords + firstWords
    let randomIndex = Int(arc4random_uniform(UInt32(allWords.count)))
    let wrongWord = (allWords[randomIndex])
    print(wrongWord)
}


func getAnswers() {
    
}

/* Old stuff that was stuffed in the view controller:
 
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
 
 }*/
 
