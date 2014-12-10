//
//  GameObjectManager.swift
//  Musketeers
//
//  Created by Arash Kashi on 10/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import Foundation
import SpriteKit

class GameObjectManager {
    var objects: [GameObject] = []
    
    // MARK: Initation
    class var sharedInstance : GameObjectManager {
        struct Static {
            static let instance : GameObjectManager = GameObjectManager()
        }
        return Static.instance
    }
    
    // game objects factory methods
    func getANewPlayerWith(node: SKNode) -> PlayerGameObject {
        var player = PlayerGameObject(node: node)
        objects.append(player)
        return player
    }
    
    // MARK: update Method
    func update(dt: Double) {
        for object in objects {

        }
    }
}
