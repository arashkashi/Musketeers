//
//  GameScene.swift
//  Musketeers
//
//  Created by Arash Kashi on 10/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var hitBar : HitBarGameObject?
    
    override func didMoveToView(view: SKView)
    {
        // Create objects
        
        initFloor()
        initMainPlayer()
        initHitBar()
        addAllMovingBackgrounds()
        
        // Create Systems
        runningSubSystem()
        enemySpawningSubSystem()        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        //spawnNewEnemy()
        for touch: AnyObject in touches
        {
            var location = touch.locationInNode(self);
            var touched = nodeAtPoint( location );
            if ( touched.name == "start" )
            {
                hitBar?.start( RandUtil.randRange(1, upper: 3) )
            }
            if ( touched.name == "hit" )
            {
                hitBar?.hit();
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval)
    {
        GameObjectManager.sharedInstance.update(currentTime)
        SystemManager.sharedInstance.update(currentTime)
    }

    // MARK: Initiation of Game Objects
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
            GameObjectManager.sharedInstance.createANewGameObjectWith(node, type: .Player)
        } else {
            assert(false, "coult not find the node")
        }
    }
    
    func initHitBar()
    {
        var bar = SKNode(fileNamed: "HitBar").children[0] as? SKSpriteNode
        bar?.removeFromParent();
        bar?.position = CGPoint(x: 156, y: 366)
        self.addChild(bar!);
        
        if let node = bar {
            self.hitBar  = GameObjectManager.sharedInstance.createANewGameObjectWith(node, type: .HitBar) as? HitBarGameObject;
            self.hitBar?.initBar();
            self.hitBar?.start(1);
        } else {
            assert(false, "coult not find the node HitBar")
        }

    }
    
    func spawnNewEnemy() {
        var enemy = SKNode(fileNamed: "Enemy").children[0] as? SKSpriteNode
        enemy?.removeFromParent()
        enemy?.position = CGPoint(x: 100, y: 100)
        self.addChild(enemy!)
        GameObjectManager.sharedInstance.createANewGameObjectWith(enemy!, type: .Enemy)
    }
    
    func addAllMovingBackgrounds() {
        var list = ["mbg2_L1", "mbg3_L1", "mbg1_L1"]
        for tileID in list {
            var bgTile = self.childNodeWithName(tileID)
            GameObjectManager.sharedInstance.createANewGameObjectWith(bgTile!, type: .MoivingBGL1)
        }
        
        list = ["mbg2_L2", "mbg3_L2", "mbg1_L2"]
        for tileID in list {
            var bgTile = self.childNodeWithName(tileID)
            GameObjectManager.sharedInstance.createANewGameObjectWith(bgTile!, type: .MoivingBGL2)
        }
    }
    
    // MARK: Initiation of the systems
    func runningSubSystem() {
        SystemManager.sharedInstance.createSubsystemWith(.Running)
    }
    
    func enemySpawningSubSystem() {
        SystemManager.sharedInstance.createSubsystemWith(.EnemySpawning)
    }
}
