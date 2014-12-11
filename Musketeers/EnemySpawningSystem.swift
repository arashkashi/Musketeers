//
//  EnemySpawningSystem.swift
//  Musketeers
//
//  Created by Arash Kashi on 11/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import Foundation

class EnemySpawningSystem: Subsystem {
    
    override init() {
        super.init()
        self.type = .EnemySpawning
    }
    
    override func update(dt: Double) {
    }
    
}
