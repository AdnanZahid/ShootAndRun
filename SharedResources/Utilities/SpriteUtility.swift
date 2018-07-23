//
//  SpriteUtility.swift
//  ShootAndRun
//
//  Created by Adnan Zahid on 6/24/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import SpriteKit

class SpriteUtility {

    static func createSpriteWithAnimationAtlas(atlasName: String) -> SKSpriteNode {
    
        var frames: Array <SKTexture> = Array()
        let atlas: SKTextureAtlas = SKTextureAtlas.init(named: atlasName)
        
        for i in 1...atlas.textureNames.count {
            let textureName: String = String.init(stringLiteral: "\(atlasName)\(i)")
            let texture: SKTexture = atlas.textureNamed(textureName)
            frames.append(texture)
        }
        
        let texture: SKTexture = frames[0]
        let sprite: SKSpriteNode = SKSpriteNode.init(texture: texture)
        
        sprite.run(SKAction.repeatForever(SKAction.animate(with: frames, timePerFrame: 0.1, resize: true, restore: true)))
        
        return sprite;
    }
}
