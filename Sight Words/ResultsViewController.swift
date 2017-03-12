//
//  ResultsViewController.swift
//  Sight Words
//
//  Created by Mark Drouillard on 3/11/17.
//  Copyright © 2017 Mark Drouillard. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sharedScoreManager.calculateAchievedLevel()
        
        finalScoreLabel.text = " \(sharedScoreManager.totalNumberWords - sharedWordManager.score) more words to be the sight word champ"
        
        percentCorrect.text = "\(sharedScoreManager.percentCorrect)%"
        
        wordListToPractice.text = "from the \(sharedScoreManager.childAchievedLevel) word list"

        // Do any additional setup after loading the view.
    }
    
    // Labels
    @IBOutlet weak var finalScoreLabel: UILabel!
    @IBOutlet weak var percentCorrect: UILabel!
    
    @IBOutlet weak var wordListToPractice: UILabel!
    
    // Buttons
    @IBAction func restartGame(_ sender: UIButton) {
        sharedWordManager.resetGame()
        
    }
    
   
   
}
