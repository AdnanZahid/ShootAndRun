//
//  GameViewController.swift
//  ShootAndRun
//
//  Created by Adnan Zahid on 6/24/16.
//  Copyright (c) 2016 Adnan Zahid. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadScene()
    }
    
    func loadScene() {
        
        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .resizeFill
            
            skView.presentScene(scene)
        }
    }
    
    @IBAction func resetSceneButtonTapped(sender: AnyObject) {
        
        loadScene()
    }
}
