//
//  GameObject.swift
//  Musketeers
//
//  Created by Arash Kashi on 10/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import Foundation
import SpriteKit

class GameObject {
    var node: SKNode?
    var dt: Double!
    
    init(node: SKNode?) {
        self.node = node
    }
    
    func update(dt: Double) {
        if self.dt == nil {
            self.dt = 0
        } else {
            self.dt = dt - self.dt
        }
    }
}
