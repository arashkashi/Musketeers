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
        
        spawnNewEnemy()

        for touch: AnyObject in touches {

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
            node.physicsBody?.friction = 0
        } else {
            assert(false, "Could not find the node")
        }
    }
    
    func initMainPlayer() {
        var player = self.childNodeWithName("player")
        if let node = player {
            GameObjectManager.sharedInstance.getANewGameObjectWith(node, type: .Player)
        } else {
            assert(false, "coult not find the node")
        }
    }
    
    func spawnNewEnemy() {
        var enemy = SKNode(fileNamed: "Enemy").children[0] as? SKSpriteNode
        enemy?.removeFromParent()
        enemy?.position = CGPoint(x: 100, y: 100)
        self.addChild(enemy!)
        if let node = enemy{
            GameObjectManager.sharedInstance.getANewGameObjectWith(node, type: .Enemy)
        }
        
    }
}
