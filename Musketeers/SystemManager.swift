//
//  SystemManager.swift
//  Musketeers
//
//  Created by Arash Kashi on 11/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import Foundation
import SpriteKit


class SystemManager {
    var subSystems: [Subsystem] = []
    
    // MARK: Initation
    class var sharedInstance : SystemManager {
        struct Static {
            static let instance : SystemManager = SystemManager()
        }
        return Static.instance
    }
    
    // MARK: Query system manager 
    func subSystemWithType(type: SystemType) -> Subsystem {
        return subSystems.filter{$0.type == type}[0] as Subsystem
    }
    
    // MARK: System Factory
    func createSubsystemWith(type: SystemType, scene: SKScene?) -> Subsystem {
        var subSystem: Subsystem?
        
        switch type {
        case .Running:
            subSystem = RunningSystem()
        case .EnemySpawning:
            subSystem = EnemySpawningSystem(scene: scene!)
        case .FightingSystem:
            subSystem = FightingSystem(scene: scene!)
        default:
            subSystem = nil
            assert(false, "did not recognize the type")
        }
        
        subSystems.append(subSystem!)
        return subSystem!
    }
    
    func update(dt: Double) {
        for subSystem in subSystems {
            subSystem.update(dt)
        }
    }
}


