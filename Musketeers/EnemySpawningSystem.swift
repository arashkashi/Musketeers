//
//  EnemySpawningSystem.swift
//  Musketeers
//
//  Created by Arash Kashi on 11/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import Foundation
import SpriteKit

class EnemySpawningSystem: Subsystem {
    var gameScene: SKScene!
    
    init(scene: SKScene) {
        super.init()
        self.type = .EnemySpawning
        self.gameScene = scene
    }
    
    override func update(dt: Double) {
        super.update(dt)
        
    }
    
    func spawnNewEnemy() {
        var enemy = SKNode(fileNamed: "Enemy").children[0] as? SKSpriteNode
        enemy?.removeFromParent()
        enemy?.position = CGPoint(x: 500, y: 100)
        gameScene.addChild(enemy!)
        GameObjectManager.sharedInstance.createANewGameObjectWith(enemy!, type: .Enemy)
    }
}
