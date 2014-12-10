//
//  GameScene.swift
//  Musketeers
//
//  Created by Arash Kashi on 10/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        
        initFloor()
        initMainPlayer()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {

        for touch: AnyObject in touches {
            var player = self.childNodeWithName("player")
            player?.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 10))
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
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
    
    func initMainPlayer() {
        var player = self.childNodeWithName("player")
        if let node = player {
            GameObjectManager.sharedInstance.getANewPlayerWith(player!)
        } else {
            assert(false, "coult not find the node")
        }
    }
}
