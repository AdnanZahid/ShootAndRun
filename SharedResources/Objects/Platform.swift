//
//  Platform.swift
//  ShootAndRun
//
//  Created by Adnan Zahid on 7/12/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import SpriteKit

class Platform {
    
    ////////////////////////////////////////
    //              VARIABLES             //
    ////////////////////////////////////////
    
    let sprite: SKNode
    
    ////////////////////////////////////////
    //              FUNCTIONS             //
    ////////////////////////////////////////
    
    init(x: CGFloat, height: CGFloat) {
        
        sprite = SKNode.init()
        
        let y: CGFloat = CGFloat(kPlatformHeight + arc4random_uniform(UInt32(height/2)))
        
        let blockType: UInt32 = 1 + arc4random_uniform(kTypesOfBlocks)
        
        let numberOfBlocks: UInt32 = kMinimumBlocksForPlatform + arc4random_uniform(kMaximumBlocksForPlatform - kMinimumBlocksForPlatform)
        
        for i in 0 ..< numberOfBlocks {
            
            let block: SKSpriteNode = SKSpriteNode.init(imageNamed: "Platform\(blockType)")
            block.position = CGPointMake(x + CGFloat(i) * block.frame.width, y)
            
            block.physicsBody = SKPhysicsBody.init(rectangleOfSize: block.size)
            block.physicsBody?.categoryBitMask = kPlatformCategoryMask
            block.physicsBody?.collisionBitMask = Hero.bodyCategoryMask | Enemy.bodyCategoryMask
            block.physicsBody?.contactTestBitMask = Hero.bodyCategoryMask | Enemy.bodyCategoryMask
            block.physicsBody?.dynamic = false
            
            sprite.addChild(block)
        }
    }
}
