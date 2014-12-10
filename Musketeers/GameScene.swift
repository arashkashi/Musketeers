//
//  GameScene.swift
//  Musketeers
//
//  Created by Arash Kashi on 10/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var hitBar : SKNode?;
    var arrow : SKNode?;
    var offset : CGFloat?;
    var accelerationRatio : CGFloat = 70;
    
    override func didMoveToView(view: SKView)
    {
        initFloor()
        initMainPlayer()
        initHitBar();
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {

        for touch: AnyObject in touches {
            var player = self.childNodeWithName("player")
            player?.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 10))
        }
    }
   
    override func update(currentTime: CFTimeInterval)
    {
        arrow!.position.x += 1 + ( ( arrow!.position.x + offset! ) / accelerationRatio );
        if ( arrow!.position.x > offset )
        {
            arrow!.position.x = -offset!;
        }
    }
    
    
    // MARK: Initiation
    
    
    func initFloor() {
        var floor = self.childNodeWithName("floor")
        if let node = floor {
            node.physicsBody = SKPhysicsBody(rectangleOfSize: node.frame.size)
            node.physicsBody?.dynamic = false
        } else {
            assert(false, "Could not find the node")
        }
    }
    
    func initHitBar()
    {
        hitBar = self.childNodeWithName("HitBar")!;
        offset = hitBar!.frame.width / 2 ;
        arrow = hitBar!.childNodeWithName("Arrow")!;
    }
    
    func initMainPlayer() {
        var player = self.childNodeWithName("player")
        if let node = player {
            node.physicsBody = SKPhysicsBody(rectangleOfSize: node.frame.size)
            node.physicsBody!.dynamic = true
        } else {
            assert(false, "coult not find the node")
        }
    }
}
