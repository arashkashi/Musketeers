//
//  ScoreScene.swift
//  Musketeers
//
//  Created by Arash Kashi on 10/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import SpriteKit

class ScoreScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */

    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        GameObjectManager.sharedInstance.reset()
        SystemManager.sharedInstance.reset()
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var mainViewController = appDelegate.window!.rootViewController as? GameViewController
        mainViewController!.showGameScene()
        
        
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}