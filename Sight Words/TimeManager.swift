//
//  TimeManager.swift
//  Sight Words
//
//  Created by Mark Drouillard on 3/10/17.
//  Copyright © 2017 Mark Drouillard. All rights reserved.
//

import Foundation

class TimeManager {
    
    var gameTimer = Timer()
    var seconds = 60
    
    
    func gameCountdown()  {
       
            seconds -= 1
            if seconds == 0 {
                gameTimer.invalidate()
            } else {
                return
            }
    }
    
}

let sharedTimeManager = TimeManager()
