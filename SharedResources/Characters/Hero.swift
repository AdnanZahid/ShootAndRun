//
//  Hero.swift
//  ShootAndRun
//
//  Created by Adnan Zahid on 7/12/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import SpriteKit

class Hero: PlayingSide {
    
    override class var playerDirection: CGFloat { return 1 }
    override class var bodyCategoryMask: UInt32 { return 0x1 << 1 }
    override class var bulletCategoryMask: UInt32 { return 0x1 << 11 }
    override class var enemyCategoryMask: UInt32 { return 0x1 << 2 }
    override class var fireFrequency: TimeInterval { return 0.1.seconds }
    override class var dyingAnimation: Animation { return .Explosion }
    override class var shouldRemoveAfterDying: Bool { return true }
    
    override class var bodyCharge: CGFloat { return 0 }
    override class var bulletCharge: CGFloat { return -1 }
    
    override func makeForceField() -> SKFieldNode {
        return SKFieldNode.init()
    }
}
