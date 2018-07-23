//
//  Enemy.swift
//  ShootAndRun
//
//  Created by Adnan Zahid on 7/12/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import SpriteKit

class Enemy: PlayingSide {
    
    override class var playerDirection: CGFloat { return -1 }
    override class var bodyCategoryMask: UInt32 { return 0x1 << 2 }
    override class var bulletCategoryMask: UInt32 { return 0x1 << 12 }
    override class var enemyCategoryMask: UInt32 { return 0x1 << 1 }
    override class var fireFrequency: TimeInterval { return 1.second }
    override class var dyingAnimation: Animation { return .Explosion }
    override class var shouldRemoveAfterDying: Bool { return true }
    
    override class var bodyCharge: CGFloat { return 1 }
    override class var bulletCharge: CGFloat { return 0 }
    
    override func makeForceField() -> SKFieldNode {
        
        let gravityField = SKFieldNode.radialGravityField()
        gravityField.region = SKRegion(radius: 1000.0)
        gravityField.strength = 0.5
        gravityField.physicsBody?.charge = Enemy.bodyCharge
        gravityField.isEnabled = true
        
        return gravityField
    }
}
