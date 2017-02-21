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
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    func counter() {
        seconds -= 1
        timerLabel.text = String(seconds)
        
        if seconds == 0 {
            timer.invalidate()
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
