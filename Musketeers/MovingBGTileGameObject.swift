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
    
    var velocity: CGVector = CGVector(dx: -0.00001, dy: 0)
    
    init(node: SKNode?, type: GameObjectType) {
        super.init(node: node)
        
        if type == .MoivingBGL2 {
            velocity = CGVector(dx: -0.00005, dy: 0)
        }
    }
    
    override func update(dt: Double, allObject: [GameObject]) {
        super.update(dt, allObject: allObject)
        
        node!.position = CGPoint(x: node!.position.x + self.velocity.dx * CGFloat(self.dt) , y: node!.position.y + self.velocity.dy * CGFloat(self.dt))
        
        if node!.position.x < -1 * node!.frame.size.width / 2 {
            node!.position = CGPoint(x: 5 * node!.frame.size.width / 2 , y: node!.position.y)
        }
    }

}