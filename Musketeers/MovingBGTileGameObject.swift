//
//  MovingBGTileGameObject.swift
//  Musketeers
//
//  Created by Arash K. on 10/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import UIKit
import SpriteKit

class MovingBGTileGameObject: GameObject {
    var playerGameObject: PlayerGameObject!
    var velocity: CGVector = CGVector(dx: 0, dy: 0)
    
    init(node: SKNode?, type: GameObjectType) {
        super.init(node: node)
        self.type = type
    }
    
    override func update(dt: Double, allObject: [GameObject]) {
        super.update(dt, allObject: allObject)
        
        if playerGameObject == nil { initiation() }
        
        if self.type! == .MoivingBGL1 {
            self.velocity = CGVector(dx: -1 * playerGameObject.speed, dy: 0)
        } else {
            self.velocity = CGVector(dx: -1 * playerGameObject.speed * 0.5, dy: 0)
        }

        node!.position = CGPoint(x: node!.position.x + self.velocity.dx * CGFloat(self.dt) , y: node!.position.y + self.velocity.dy * CGFloat(self.dt))
        
        if node!.position.x < -1 * node!.frame.size.width / 2 {
            node!.position = CGPoint(x: 5 * node!.frame.size.width / 2 , y: node!.position.y)
        }
    }
    
    func initiation() {
        playerGameObject = GameObjectManager.sharedInstance.gameObjectsWithType(.Player)[0] as PlayerGameObject
    }

}
