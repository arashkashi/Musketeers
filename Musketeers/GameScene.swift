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
        
        spawnNewEnemy()

        for touch: AnyObject in touches {

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
            node.physicsBody?.friction = 0
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
