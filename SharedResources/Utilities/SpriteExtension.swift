//
//  SpriteExtension.swift
//  ShootAndRun
//
//  Created by Adnan Zahid on 7/1/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import SpriteKit

extension SKSpriteNode {
    
    func applyAnimationAtlasToSprite(atlasName: String, forever: Bool, completionHandler: @escaping () -> Void) {
        
        if atlasName != kNoneAnimation {
            var frames: Array <SKTexture> = Array()
            let atlas: SKTextureAtlas = SKTextureAtlas.init(named: atlasName)
            
            for i in 1...atlas.textureNames.count {
                let textureName: String = String.init(stringLiteral: "\(atlasName)\(i)")
                let texture: SKTexture = atlas.textureNamed(textureName)
                frames.append(texture)
            }
            
            removeAllActions()
            runAction(frames: frames, forever: forever, completionHandler: completionHandler)
        }
    }
    
    func runAction(frames: Array <SKTexture>, forever: Bool, completionHandler: @escaping () -> Void) {
        
        if forever == false {
            
            run(SKAction.animate(with: frames, timePerFrame: 0.1, resize: true, restore: true), completion: completionHandler)
        } else {
            
            run(SKAction.repeatForever(SKAction.animate(with: frames, timePerFrame: 0.1, resize: true, restore: true)), completion: completionHandler)
        }
    }
}
