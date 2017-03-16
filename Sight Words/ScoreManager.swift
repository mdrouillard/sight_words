//
//  ScoreManager.swift
//  Sight Words
//
//  Created by Mark Drouillard on 3/12/17.
//  Copyright © 2017 Mark Drouillard. All rights reserved.
//

import Foundation

class ScoreManager {
    
    static let shared = ScoreManager()
    
    var childAchievedLevel = ""
    var percentCorrect = 0
    var totalNumberWords = 0
    
   
    
    func calculateAchievedLevel() {
        let totalPreSchoolLevelWords = Double(WordManager.shared.preschoolWordNumber)
        let totalKindergartenLevelWords = totalPreSchoolLevelWords + Double(WordManager.shared.kindergardenWordNumber)
        let totalFirstGradeLevelWords = Double(WordManager.shared.preschoolWordNumber + WordManager.shared.firstGradeWordNumber)
        let totalSecondGradeLevelWords = totalFirstGradeLevelWords + Double(WordManager.shared.secondGradeWordNumber)
        let totalThirdGradeLevelWords = totalSecondGradeLevelWords + Double(WordManager.shared.thirdGradeWordNumber)
        totalNumberWords = Int(totalThirdGradeLevelWords)
        let scoreDouble = Double(WordManager.shared.score)
        
        
        if scoreDouble <= totalPreSchoolLevelWords {
            childAchievedLevel = "Preschool"
            let percentage = round(scoreDouble / totalPreSchoolLevelWords * 100)
            percentCorrect = Int(percentage)
           
        }
            
        else if scoreDouble >= totalPreSchoolLevelWords && scoreDouble < totalFirstGradeLevelWords {
            childAchievedLevel = "Kindergarten"
            let percentage = round(scoreDouble / totalKindergartenLevelWords  * 100)
            percentCorrect = Int(percentage)
            
        }
        else if scoreDouble >= totalFirstGradeLevelWords && scoreDouble < totalSecondGradeLevelWords {
            childAchievedLevel = "1st Grade"
            let percentage = round(scoreDouble / totalFirstGradeLevelWords * 100)
            percentCorrect = Int(percentage)

        }
        else if scoreDouble >= totalSecondGradeLevelWords && scoreDouble < totalThirdGradeLevelWords {
            childAchievedLevel = "2nd Grade"
            let percentage = round(scoreDouble / totalSecondGradeLevelWords * 100)
            percentCorrect = Int(percentage)
        }
        else {
            childAchievedLevel = "3rd Grade"
            let percentage = round(scoreDouble / totalThirdGradeLevelWords * 100)
            percentCorrect = Int(percentage)
        }
        
    }
}

