//
//  HitBar.swift
//  Musketeers
//
//  Created by mkec on 12/10/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import Foundation
import SpriteKit

class HitBar: SKScene{
    
    override func didMoveToView(view: SKView) {
        
        initBar();
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
    func initBar() {
        var arrow = self.childNodeWithName("Arrow");
        arrow?.position.x = 100;
    }
    
    
    
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
            node.physicsBody = SKPhysicsBody(rectangleOfSize: node.frame.size)
            node.physicsBody!.dynamic = true
        } else {
            assert(false, "coult not find the node")
        }
    }
}