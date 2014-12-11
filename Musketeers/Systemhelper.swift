//
//  Systemhelper.swift
//  Musketeers
//
//  Created by Arash Kashi on 11/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import Foundation


enum SystemType {
    case Running
    case EnemySpawning
}

class Subsystem {
    var dt: Double!
    var type: SystemType!
    var objectMgr: GameObjectManager = GameObjectManager.sharedInstance
    
    init() {
        
    }
    
    func update(dt: Double) {
        if self.dt == nil {
            self.dt = 0
        } else {
            self.dt = dt - self.dt
        }
    }
}