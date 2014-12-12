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
    
    func die(completionhandler: (()->())?) {
        var enemy = SKNode(fileNamed: "MyParticle") as SKEmitterNode
//        enemy.removeFromParent()
        
        
        var hideEnemy = SKAction.runBlock { () -> Void in
            self.node!.alpha = 0
        }
        
        var showExplosion = SKAction.runBlock { () -> Void in
            enemy.position = self.node!.position
            self.node?.parent?.addChild(enemy)
        }
        
        var delay = SKAction.waitForDuration(0.5)
    
        var complete = SKAction.runBlock { () -> Void in
            enemy.removeFromParent()
            self.node?.removeFromParent()
            if completionhandler != nil { completionhandler!() }
        }
        
        node!.runAction( SKAction.sequence([showExplosion, delay, hideEnemy, delay, complete]) , withKey: "die");
    }
}
