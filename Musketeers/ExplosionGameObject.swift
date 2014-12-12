//
//  ExplosionGameObject.swift
//  Musketeers
//
//  Created by Arash Kashi on 12/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import Foundation
import SpriteKit

class ExplosionGameObject : GameObject
{
    var position: CGPoint?
    
    override init(node: SKNode?) {
        
        super.init(node: node)
        type = .Explosion;
        self.position = node!.position
        
        
        
    }
}
    

