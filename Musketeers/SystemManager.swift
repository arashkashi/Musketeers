//
//  SystemManager.swift
//  Musketeers
//
//  Created by Arash Kashi on 11/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import Foundation
import SpriteKit

enum SystemType {
    case RunningSystem
}

class Subsystem {
    var dt: Double!
    
    func update(dt: Double) {
        if self.dt == nil {
            self.dt = 0
        } else {
            self.dt = dt - self.dt
        }
    
    }
}

class RunningSystem: Subsystem {
    
    override func update(dt: Double) {
        super.update(dt)
    }
}

class SystemManager {
    var subSystems: [Subsystem] = []
    
    // MARK: Initation
    class var sharedInstance : SystemManager {
        struct Static {
            static let instance : SystemManager = SystemManager()
        }
        return Static.instance
    }
    
    // MARK: System Factory
    func createSubsystemWith(type: SystemType) -> Subsystem {
        var subSystem: Subsystem?
        
        switch type {
        case .RunningSystem:
            subSystem = RunningSystem()
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


