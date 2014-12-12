//
//  GameViewController.swift
//  Musketeers
//
//  Created by Arash Kashi on 10/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    @IBOutlet var gameViewContainer: SKView!
    
    // MARK: Swich between scenes
    func showGameScene() {
        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
            // Configure the view.
            let skView = self.gameViewContainer as SKView
            skView.showsFPS = false
            skView.showsNodeCount = false
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .Fill
            
            skView.presentScene(scene)
        }
    }
    
    func showScoreScene() {
        if let scene = ScoreScene.unarchiveFromFileForGameScore("ScoreScene") as? ScoreScene {
            // Configure the view.
            let skView = self.gameViewContainer as SKView
            skView.showsFPS = false
            skView.showsNodeCount = false
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
    }
    
    // MARK: IB Actions
    @IBAction func onSwitchSceneTapped(sender: AnyObject) {
        showScoreScene()
    }
    
    @IBAction func onSpanwEnemyTapped(sender: AnyObject) {
        var spawningSystem = SystemManager.sharedInstance.subSystemWithType(.EnemySpawning) as EnemySpawningSystem
        spawningSystem.spawnNewEnemy()
    }
    
    // MARK: View Controller methods source
    override func viewDidLoad() {
        super.viewDidLoad()
        showGameScene()
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
