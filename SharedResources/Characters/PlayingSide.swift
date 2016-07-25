//
//  PlayingSide.swift
//  ShootAndRun
//
//  Created by Adnan Zahid on 7/12/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import SpriteKit

class PlayingSide {
    
    class var playerDirection: CGFloat { return 0 }
    class var bodyCategoryMask: UInt32 { return 0 }
    class var bulletCategoryMask: UInt32 { return 0 }
    class var enemyCategoryMask: UInt32 { return 0 }
    class var fireFrequency: NSTimeInterval { return 0 }
    class var dyingAnimation: Animation { return .None }
    class var shouldRemoveAfterDying: Bool { return false }
    
    class var bodyCharge: CGFloat { return 0 }
    class var bulletCharge: CGFloat { return 0 }
    
    func makeForceField() -> SKFieldNode {
        return SKFieldNode.init()
    }
}
