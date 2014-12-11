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
    let normalSpeed: CGFloat = 0.0001
    var speed: CGFloat = 0.0001 {
        didSet {
            print("Iam here")
        }
    }
    var acceleration: CGFloat = 0.0
    var distancetravelled: CGFloat = 0.0
    
    var toadRun : SKSpriteNode! = SKSpriteNode(imageNamed: "toad-run");
    
    override init(node: SKNode?) {
        super.init(node: node)
        type = .Player
        node!.physicsBody = SKPhysicsBody(rectangleOfSize: node!.frame.size)
        node!.physicsBody!.dynamic = true
        
        node!.physicsBody?.categoryBitMask = ENEMY
        node!.physicsBody?.collisionBitMask = PLAYER
        node!.physicsBody?.categoryBitMask = 0
        
        
        node!.addChild(toadRun);
        let toad_run_anim = SKAction.animateWithTextures([
            SKTexture(imageNamed: "toad-run0001"),
            SKTexture(imageNamed: "toad-run0002"),
            SKTexture(imageNamed: "toad-run0003"),
            SKTexture(imageNamed: "toad-run0004"),
            SKTexture(imageNamed: "toad-run0005"),
            SKTexture(imageNamed: "toad-run0006"),
            SKTexture(imageNamed: "toad-run0007"),
            SKTexture(imageNamed: "toad-run0008"),
            SKTexture(imageNamed: "toad-run0009"),
            SKTexture(imageNamed: "toad-run0010"),
            SKTexture(imageNamed: "toad-run0011"),
            SKTexture(imageNamed: "toad-run0012"),
            ], timePerFrame: 0.06)
        
        let run = SKAction.repeatActionForever(toad_run_anim)
        
        toadRun.runAction( run, withKey: "running");
    }
    
    override func update(dt: Double, allObject: [GameObject]) {
        super.update(dt, allObject: allObject)
        
        // Update distance
        distancetravelled = speed * CGFloat(self.dt) + distancetravelled
        
        // Update speed based on Acc.
//        speed = acceleration * CGFloat(self.dt) + speed
    }
    
    func hit(enemy: EnemyGameObject, completionhandler: (()->())?) {
        showGameObjectbeingHitAnimation(enemy, completionhandler: { () -> () in
            if completionhandler != nil { completionhandler!() }
        })
    }
}
