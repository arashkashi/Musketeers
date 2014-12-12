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
        
        /*if self.type! == .MoivingBGL1 {
            self.velocity = CGVector(dx: -1 * playerGameObject.speed, dy: 0)
        } else {
            self.velocity = CGVector(dx: -1 * playerGameObject.speed * 0.5, dy: 0)
        }*/
        
        if self.type! == .MoivingBGL1 {
            self.velocity = CGVector(dx: 2, dy: 0)
        } else {
            self.velocity = CGVector(dx: 3, dy: 0)
        }

        node!.position.x = CGFloat( Int( node!.position.x ) - Int( self.velocity.dx ) );
        
        if node!.position.x < -1 * node!.frame.size.width / 2 {
            node!.position = CGPoint(x: 770 , y: node!.position.y)
        }
    }
    
    func initiation() {
        playerGameObject = GameObjectManager.sharedInstance.gameObjectsWithType(.Player)[0] as PlayerGameObject
    }

}
