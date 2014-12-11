//
//  GameObjectManager.swift
//  Musketeers
//
//  Created by Arash Kashi on 10/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import Foundation
import SpriteKit


let PLAYER: UInt32  = 0x1 << 0
let ENEMY: UInt32   = 0x1 << 1


enum GameObjectType {
    case Player
    case Enemy
    case MoivingBGL1
    case MoivingBGL2
}

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
    func getANewGameObjectWith(node: SKNode, type: GameObjectType) -> GameObject {
        var gameObject: GameObject?
        
        switch type {
        case .Player:
            gameObject = PlayerGameObject(node: node)
        case .Enemy:
            gameObject = EnemyGameObject(node: node)
        case .MoivingBGL1:
            gameObject = MovingBGTileGameObject(node: node, type: .MoivingBGL1)
        case .MoivingBGL2:
            gameObject = MovingBGTileGameObject(node: node, type: .MoivingBGL2)
        default:
            gameObject = nil
            assert(false, "did not recognize the type")
        }

        objects.append(gameObject!)
        return gameObject!
    }
    
    // MARK: update Method
    func update(dt: Double) {
        for object in objects {
            object.update(dt, allObject: self.objects)
        }
    }
}
