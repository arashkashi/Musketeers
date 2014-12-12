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
    
    var toadRun : SKSpriteNode! = SKSpriteNode(imageNamed: "toad-run0001");
    var toadHit1 : SKSpriteNode! = SKSpriteNode(imageNamed: "toad-hit-0001");
    var toadHit2 : SKSpriteNode! = SKSpriteNode(imageNamed: "toad-hit-20001");
    var toadHit3 : SKSpriteNode! = SKSpriteNode(imageNamed: "toad-hit3-0001");
    
    
    override init(node: SKNode?) {
        super.init(node: node)
        type = .Player;
        node!.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 150, height: 150))
        node!.physicsBody!.dynamic = true
        
        node!.physicsBody?.categoryBitMask = ENEMY
        node!.physicsBody?.collisionBitMask = PLAYER
        node!.physicsBody?.categoryBitMask = 0
        
        
        ///RUNNING
        node!.addChild(toadRun);
        var animArray = [SKTexture]();
        for var index = 1; index < 13; index++
        {
            var prefix : String = "";
            if ( index < 10 ) { prefix = "0"; }
            var imageName : String = "toad-run00" + prefix + String( index );
            animArray.append( SKTexture(imageNamed: imageName))
        }
        let toad_run_anim = SKAction.animateWithTextures( animArray, timePerFrame: 0.06 )
        let run = SKAction.repeatActionForever(toad_run_anim)
        
        ///HITTING 1
        node!.addChild(toadHit1);
        toadHit1.alpha = 0;
        animArray = [SKTexture]();
        for var index = 1; index < 28; index++
        {
            var prefix : String = "";
            if ( index < 10 ) { prefix = "0"; }
            var imageName : String = "toad-hit-00" + prefix + String( index );
            animArray.append( SKTexture(imageNamed: imageName))
        }
        let toad_hit1_anim = SKAction.animateWithTextures( animArray, timePerFrame: 0.06 )
        let hit1 = SKAction.repeatActionForever(toad_hit1_anim)

        ///HITTING 2
        node!.addChild(toadHit2);
        toadHit2.alpha = 0;
        animArray = [SKTexture]();
        for var index = 1; index < 16; index++
        {
            var prefix : String = "";
            if ( index < 10 ) { prefix = "0"; }
            var imageName : String = "toad-hit-200" + prefix + String( index );
            animArray.append( SKTexture(imageNamed: imageName))
        }
        let toad_hit2_anim = SKAction.animateWithTextures( animArray, timePerFrame: 0.06 )
        let hit2 = SKAction.repeatActionForever(toad_hit2_anim)
        
        ///HITTING 3
        node!.addChild(toadHit3);
        toadHit3.alpha = 0;
        animArray = [SKTexture]();
        for var index = 1; index < 14; index++
        {
            var prefix : String = "";
            if ( index < 10 ) { prefix = "0"; }
            var imageName : String = "toad-hit3-00" + prefix + String( index );
            animArray.append( SKTexture(imageNamed: imageName))
        }
        let toad_hit3_anim = SKAction.animateWithTextures( animArray, timePerFrame: 0.06 )
        let hit3 = SKAction.repeatActionForever(toad_hit3_anim)
        
        toadRun.runAction( run, withKey: "running");
    }
    
    override func update(dt: Double, allObject: [GameObject]) {
        super.update(dt, allObject: allObject)
        
        // Update distance
        distancetravelled = ( speed / 70 ) * CGFloat(self.dt) + distancetravelled;
        
        // Update speed based on Acc.
//        speed = acceleration * CGFloat(self.dt) + speed
    }
    
    func hit(enemy: EnemyGameObject, completionhandler: (()->())?) {
        showGameObjectbeingHitAnimation(enemy, completionhandler: { () -> () in
            if completionhandler != nil { completionhandler!() }
        })
    }
}
