//
//  EnemyGameObject.swift
//  Musketeers
//
//  Created by Arash Kashi on 10/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import Foundation
import SpriteKit

class EnemyGameObject: GameObject {
    
    override init(node: SKNode?) {
        super.init(node: node)
        node!.physicsBody = SKPhysicsBody(rectangleOfSize: node!.frame.size)
        node!.physicsBody!.dynamic = true
        node!.physicsBody!.velocity = CGVector(dx: -100, dy: 0)
    }
}
