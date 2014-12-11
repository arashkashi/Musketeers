
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
    var hitBar: HitBarGameObject!
    
    var fightIsHappening: Bool = false
    
    init(scene: SKScene) {
        super.init()
        self.type = .EnemySpawning
        self.gameScene = scene
    }
    
    override func update(dt: Double) {
        super.update(dt)
        
        // No enemies on screen, no fighting.
        if enemiesONScreen().count == 0 {
            return
        }
        
        if player == nil || enemy == nil || hitBar == nil { initGameObjects() }
        
        if player.distanceTo(enemy) < 50 && !fightIsHappening{
            player.speed = 0
            onFightStarted()
        }
    }
    
    func enemiesONScreen() -> [GameObject] {
        return GameObjectManager.sharedInstance.gameObjectsWithType(.Enemy)
    }
    
    func initGameObjects() {
        player = GameObjectManager.sharedInstance.gameObjectsWithType(.Player)[0] as PlayerGameObject
        enemy = GameObjectManager.sharedInstance.gameObjectsWithType(.Enemy)[0] as EnemyGameObject
        hitBar = GameObjectManager.sharedInstance.gameObjectsWithType(.HitBar)[0] as HitBarGameObject
    }
    
    // MARK: Events
    func onFightStarted() {
        var counter = hitBar.hitScores.count
        fightIsHappening = true
        
        for score in hitBar.hitScores {
            if score > 0 {
                player.hit(enemy, completionhandler: { () -> () in
                    counter--
                    if counter == 0 {
                        self.onFightEnded()
                    }
                })
            } else {
                enemy.hit(player,completionhandler: { () -> () in
                    counter--
                    if counter == 0 {
                        self.onFightEnded()
                    }
                })
            }
        }
    }
    
    func onFightEnded() {
        fightIsHappening = false
        
        // when the player wins
        if hitBar.combarResult! {
            // Remove the enemy
            GameObjectManager.sharedInstance.removeGameobject(enemy)
            hitBar.start( RandUtil.randRange(1, upper: 3), speed: RandUtil.randRange(1, upper: 4) );
        } else {
            // Show result menu, the player hs lost the game
            let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
            var mainViewController = appDelegate.window!.rootViewController as? GameViewController
            mainViewController!.showScoreScene()
        }
    }
    

}
