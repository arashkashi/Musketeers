//
//  PlayerGameObject.swift
//  Musketeers
//
//  Created by Arash Kashi on 10/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import Foundation
import SpriteKit

class PlayerGameObject: GameObject {
    var speed: CGFloat = 0.0001
    var acceleration: CGFloat = 0.0
    var distancetravelled: CGFloat = 0.0
    
    override init(node: SKNode?) {
        super.init(node: node)
        type = .Player
        node!.physicsBody = SKPhysicsBody(rectangleOfSize: node!.frame.size)
        node!.physicsBody!.dynamic = true
        
        node!.physicsBody?.categoryBitMask = ENEMY
        node!.physicsBody?.collisionBitMask = PLAYER
        node!.physicsBody?.categoryBitMask = 0
    }
    
    override func update(dt: Double, allObject: [GameObject]) {
        super.update(dt, allObject: allObject)
        
        // Update distance
        distancetravelled = speed * CGFloat(self.dt) + distancetravelled
        
        // Update speed based on Acc.
        speed = acceleration * CGFloat(self.dt) + speed
    }
}
