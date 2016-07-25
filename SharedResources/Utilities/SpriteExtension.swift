//
//  SpriteExtension.swift
//  ShootAndRun
//
//  Created by Adnan Zahid on 7/1/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import SpriteKit

extension SKSpriteNode {
    
    func applyAnimationAtlasToSprite(atlasName: String, forever: Bool, completionHandler: () -> Void) {
        
        if atlasName != kNoneAnimation {
            var frames: Array <SKTexture> = Array()
            let atlas: SKTextureAtlas = SKTextureAtlas.init(named: atlasName)
            
            for i in 1...atlas.textureNames.count {
                let textureName: String = String.init(stringLiteral: "\(atlasName)\(i)")
                let texture: SKTexture = atlas.textureNamed(textureName)
                frames.append(texture)
            }
            
            removeAllActions()
            runAction(frames, forever: forever, completionHandler: completionHandler)
        }
    }
    
    func runAction(frames: Array <SKTexture>, forever: Bool, completionHandler: () -> Void) {
        
        if forever == false {
            
            runAction(SKAction.animateWithTextures(frames, timePerFrame: 0.1, resize: true, restore: false), completion: completionHandler)
        } else {
            
            runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(frames, timePerFrame: 0.1, resize: true, restore: true)), completion: completionHandler)
        }
    }
}
