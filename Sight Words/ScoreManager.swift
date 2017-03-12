//
//  ScoreManager.swift
//  Sight Words
//
//  Created by Mark Drouillard on 3/12/17.
//  Copyright © 2017 Mark Drouillard. All rights reserved.
//

import Foundation

class ScoreManager {
    var childAchievedLevel = ""
    var percentCorrect = 0
    var totalNumberWords = 0
    
   
    
    func calculateAchievedLevel() {
        let totalPreSchoolLevelWords = Double(sharedWordManager.preschoolWordNumber)
        let totalFirstGradeLevelWords = Double(sharedWordManager.preschoolWordNumber + sharedWordManager.firstGradeWordNumber)
        let totalSecondGradeLevelWords = totalFirstGradeLevelWords + Double(sharedWordManager.secondGradeWordNumber)
        let totalThirdGradeLevelWords = totalSecondGradeLevelWords + Double(sharedWordManager.thirdGradeWordNumber)
        totalNumberWords = Int(totalThirdGradeLevelWords)
        let scoreDouble = Double(sharedWordManager.score)
        
        
        if scoreDouble <= totalPreSchoolLevelWords {
            childAchievedLevel = "Preschool"
            let percentage = round(scoreDouble / totalPreSchoolLevelWords * 100)
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

let sharedScoreManager = ScoreManager()
