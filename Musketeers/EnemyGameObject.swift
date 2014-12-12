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
    
    var enemy : SKSpriteNode! = SKSpriteNode(imageNamed: "enemy1-0001");
    var kill : SKSpriteNode! = SKSpriteNode(imageNamed: "enemy1kill-0001");
    
    var enemyAction: SKAction!
    var killAction: SKAction!
    
    override init(node: SKNode?) {
        super.init(node: node)
        type = .Enemy
        node!.physicsBody = SKPhysicsBody(rectangleOfSize: node!.frame.size)
        node!.physicsBody!.dynamic = true
        node!.physicsBody!.friction = 0
//        node!.physicsBody?.categoryBitMask = PLAYER
//        node!.physicsBody?.collisionBitMask = ENEMY
//        node!.physicsBody?.categoryBitMask = 0
        
        
        
        ///Standing
        node!.addChild(enemy);
        enemy.alpha = 0
        var animArray = [SKTexture]();
        for var index = 1; index < 40; index++
        {
            var prefix : String = "";
            if ( index < 10 ) { prefix = "0"; }
            var imageName : String = "enemy1-00" + prefix + String( index );
            animArray.append( SKTexture(imageNamed: imageName))
        }
        let toad_hit1_anim = SKAction.animateWithTextures( animArray, timePerFrame: 0.06 )
        self.enemyAction = toad_hit1_anim
        
        ///Standing
        node!.addChild(kill);
        kill.alpha = 0
        animArray = [SKTexture]();
        for var index = 1; index < 20; index++
        {
            var prefix : String = "";
            if ( index < 10 ) { prefix = "0"; }
            var imageName : String = "enemy1kill-00" + prefix + String( index );
            animArray.append( SKTexture(imageNamed: imageName))
        }
        let toad_hit1_anim2 = SKAction.animateWithTextures( animArray, timePerFrame: 0.06 )
        self.killAction = toad_hit1_anim2
        
        showEnemy();
    }
    
    func showEnemy() {
        enemy.alpha = 1
        kill.alpha = 0
        
        //if enemy.actionForKey("running") == nil {
            enemy.runAction( self.enemyAction, withKey: "running");
        //}
    }
    
    func showKill() {
        enemy.alpha = 0
        kill.alpha = 1
        
        if kill.actionForKey("running") == nil {
            kill.runAction( self.killAction, withKey: "running");
        }
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
