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
        type = .Enemy
        node!.physicsBody = SKPhysicsBody(rectangleOfSize: node!.frame.size)
        node!.physicsBody!.dynamic = true
        node!.physicsBody!.friction = 0
//        node!.physicsBody?.categoryBitMask = PLAYER
//        node!.physicsBody?.collisionBitMask = ENEMY
//        node!.physicsBody?.categoryBitMask = 0
    }
    
    override func update(dt: Double, allObject: [GameObject]) {
        var playerGameObject = allObject.filter { $0.type == GameObjectType.Player }[0] as PlayerGameObject
        
        node!.physicsBody!.velocity = CGVector(dx: -50, dy: 0)
    }
    
    func hit(player: PlayerGameObject, completionhandler: (()->())?) {
        showGameObjectbeingHitAnimation(player, completionhandler: { () -> () in
            if completionhandler != nil { completionhandler?() }
        })
    }
    
    
}
