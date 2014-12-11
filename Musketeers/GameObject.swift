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
    var type: GameObjectType!
    
    init(node: SKNode?) {
        self.node = node
    }
    
    func update(dt: Double, allObject: [GameObject]) {
        if self.dt == nil {
            self.dt = 0
        } else {
            self.dt = dt - self.dt
        }
    }
    
    func distanceTo(gameobject: GameObject) -> CGFloat {
        if self.node == nil || gameobject.node == nil { return 0.0 }
        
        return abs(self.node!.frame.origin.x - gameobject.node!.frame.origin.x)
    }
}
