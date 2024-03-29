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
let HITBAR: UInt32   = 0x1 << 2


enum GameObjectType {
    case Player
    case Enemy
    case HitBar
    case MoivingBGL1
    case MoivingBGL2
    case Explosion
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
    
    // MARK: Gameobject Factory
    func createANewGameObjectWith(node: SKNode, type: GameObjectType) -> GameObject {
        var gameObject: GameObject?
        
        switch type {
        case .Player:
            gameObject = PlayerGameObject(node: node)
        case .Enemy:
            gameObject = EnemyGameObject(node: node)
        case .HitBar:
            gameObject = HitBarGameObject(node: node)
        case .MoivingBGL1:
            gameObject = MovingBGTileGameObject(node: node, type: .MoivingBGL1)
        case .MoivingBGL2:
            gameObject = MovingBGTileGameObject(node: node, type: .MoivingBGL2)
        case .Explosion :
            gameObject = ExplosionGameObject(node: node)
        default:
            gameObject = nil
            assert(false, "did not recognize the type")
        }

        objects.append(gameObject!)
        return gameObject!
    }
    
    func gameObjectsWithType(type: GameObjectType) -> [GameObject] {
        return objects.filter { $0.type == type }
    }
    
    func removeGameobject(gameObject: GameObject) {
        // remove the node from the paretns in the scene
        if gameObject.node?.parent != nil { gameObject.node?.removeFromParent() }
        objects = objects.filter { $0.type != gameObject.type }
    }
    
    func reset() {
        for object in objects {
            if object.node != nil {
                object.node!.removeFromParent()
            }
        }
        objects.removeAll(keepCapacity: false)
    }
    
    // MARK: update Method
    func update(dt: Double) {
        for object in objects {
            object.update(dt, allObject: self.objects)
        }
    }
}
