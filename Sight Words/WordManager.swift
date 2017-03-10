//
//  WordManager.swift
//  Sight Words
//
//  Created by Mark Drouillard on 3/2/17.
//  Copyright © 2017 Mark Drouillard. All rights reserved.
//

import Foundation


class WordManager {
    
    // Words
    var preWords : [String] = ["a", "and", "away", "big", "blue", "can", "come", "down", "find", "for", "funny", "go", "help", "here", "I", "in", "is", "it", "jump", "little", "look", "make", "me", "my", "not", "one", "play", "red", "run", "said", "see", "the", "three", "to", "two", "up", "we", "where", "yellow", "you"]
    
    
    var kWords : [String] = ["all", "am", "are", "at", "ate", "be", "black", "brown", "but", "came", "did", "do", "eat", "four", "get", "good", "have", "he", "into", "like", "must", "new", "no", "now", "on", "our", "out", "please", "pretty", "ran", "ride", "saw", "say", "she", "so", "soon", "that", "there", "they", "this", "too", "under", "want", "was", "well", "went", "what", "white", "who", "will", "with", "yes"]
    
    var firstWords: [String] = ["after", "again", "an", "any", "as", "ask", "by", "could", "every", "fly", "from", "give", "going", "had", "has", "her", "him", "his", "how", "just", "know", "let", "live", "may", "of", "old", "once", "open", "over", "put", "round", "some", "stop", "take", "thank", "them", "then", "think", "walk", "were", "when"]
    
    var wordChoices = Array<String>()
    var usedWords: [String] = []
    var currentAnswer = ""
    var currentList = Array<String>()
    var wordsToWorkOn = Array<String>()
    var listCount = 0
    var score = 0

    // Choose List
    func chooseList() {
        if listCount ==  0 {
            currentList = preWords
        }
            
        else if listCount == 1 {
            currentList = kWords
            
        }
        else if kWords.count == 2 {
            currentList = firstWords
            
        } else {
            print("You win!")
            
        }

    }
    
 
    
    func setSightAnswer() {
        chooseList()
        currentAnswer = currentList[0]
    }
    
    // AnswerCollector
    func getAnswers() {
        let allWords = preWords + kWords + firstWords
        var wordCount = 0
        var answerWords = [String]()
        
        
        while wordCount < 3 {
            let randomIndex = Int(arc4random_uniform(UInt32(allWords.count)))
            let wrongWord = (allWords[randomIndex])
            answerWords.append(wrongWord)
            wordCount += 1
           
        }
        // insert word at generated index placement
        let correctIndexPlacement = Int(arc4random_uniform(4))
        answerWords.insert(currentAnswer, at: correctIndexPlacement)
        wordChoices.removeAll()
        wordChoices.append(contentsOf: answerWords)
        
    }
    
    func correctAnswerWordLists() {
        usedWords.append(currentAnswer)
        currentList.remove(at: 0)
        
        if currentList.count > 0 {
             currentAnswer = currentList[0]
        } else if currentList.count == 0 {
            listCount += 1
            chooseList()
            currentAnswer = currentList[0]
        }
       
    }
    
    func wrongAnswerWordLists() {
            wordsToWorkOn.append(currentAnswer)
            currentList.append(currentAnswer)
            currentList.remove(at: 0)
            currentAnswer = currentList[0]
       
    }
        
       

    
    
    func answerKey(correct: String, guess: String)  {
        
        // if correct, select new word, add old word to used list
        if correct == guess {
            
            correctAnswerWordLists()
            getAnswers()
            score += 1
            
        }
        else {
            // wrong answer:
            wrongAnswerWordLists()
            getAnswers()
            
            
        }
    }
    
}

let sharedWordManager = WordManager()
