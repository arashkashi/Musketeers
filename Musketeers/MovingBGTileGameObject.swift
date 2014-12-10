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
    
    var velocity: CGVector = CGVector(dx: -0.0001, dy: 0)
    
    override init(node: SKNode?) {
        super.init(node: node)
    }
    
    override func update(dt: Double) {
        super.update(dt)
        
        node!.position = CGPoint(x: node!.position.x + self.velocity.dx * CGFloat(self.dt) , y: node!.position.y + self.velocity.dy * CGFloat(self.dt))
        
        if node!.position.x < -1 * node!.frame.size.width / 2 {
            node!.position = CGPoint(x: 3 * node!.frame.size.width / 2 , y: node!.position.y)
        }
    }

}
