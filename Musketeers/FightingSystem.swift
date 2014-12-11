//
//  FightingSystem.swift
//  Musketeers
//
//  Created by Arash Kashi on 11/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import Foundation
import SpriteKit

class FightingSystem: Subsystem {
    var gameScene: SKScene!
    
    var player: PlayerGameObject!
    var enemy: EnemyGameObject!
    
    init(scene: SKScene) {
        super.init()
        self.type = .EnemySpawning
        self.gameScene = scene
    }
    
    override func update(dt: Double) {
        super.update(dt)
        
        if enemiesONScreen().count == 0 {
            return
        }
        
        if player == nil || enemy == nil { initGameObjects() }
        
        if player.distanceTo(enemy) < 50 {
            player.speed = 0
        }
    }
    
    func enemiesONScreen() -> [GameObject] {
        return GameObjectManager.sharedInstance.gameObjectsWithType(.Enemy)
    }
    
    func initGameObjects() {
        player = GameObjectManager.sharedInstance.gameObjectsWithType(.Player)[0] as PlayerGameObject
        enemy = GameObjectManager.sharedInstance.gameObjectsWithType(.Enemy)[0] as EnemyGameObject
    }
}
