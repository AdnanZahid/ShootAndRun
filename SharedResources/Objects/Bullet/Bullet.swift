//
//  Bullet.swift
//  ShootAndRun
//
//  Created by Adnan Zahid on 7/22/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import SpriteKit

class Bullet {
    
    let sprite: SKSpriteNode
    
    init(heroX: CGFloat, heroY: CGFloat, bulletType: BulletType, playingSide: PlayingSide, playerAnimation: Animation, canJump: Bool, gunspark: SKSpriteNode) {
        
        let x: CGFloat
        let y: CGFloat
        let velocity: CGVector
        let playerDirection: CGFloat = playingSide.dynamicType.playerDirection
        let bulletDirection: BulletDirection
        
        if playerAnimation == .WalkingUpForward {
            
            bulletDirection = .BulletUpForward
            velocity = CGVectorMake(kCharacterBulletSpeedX * playerDirection, kCharacterBulletSpeedY)
            
            if canJump == true {
                
                x = kBulletDistanceXFromCharacterUpForward * playerDirection
                y = kBulletDistanceYFromCharacterUpForward
                
                gunspark.position = CGPointMake(kBulletDistanceXFromCharacterUpForward, kBulletDistanceYFromCharacterUpForward)
            } else {
                
                x = kBulletDistanceXFromCharacterJumpingUpForward * playerDirection
                y = kBulletDistanceYFromCharacterJumpingUpForward
                
                gunspark.position = CGPointMake(kBulletDistanceXFromCharacterJumpingUpForward, kBulletDistanceYFromCharacterJumpingUpForward)
            }
            
        } else if playerAnimation == .WalkingDownForward {
            
            bulletDirection = .BulletDownForward
            velocity = CGVectorMake(kCharacterBulletSpeedX * playerDirection, -kCharacterBulletSpeedY)
            
            if canJump == true {
                
                x = kBulletDistanceXFromCharacterDownForward * playerDirection
                y = kBulletDistanceYFromCharacterDownForward
                
                gunspark.position = CGPointMake(kBulletDistanceXFromCharacterDownForward, kBulletDistanceYFromCharacterDownForward)
            } else {
                
                x = kBulletDistanceXFromCharacterJumpingDownForward * playerDirection
                y = kBulletDistanceYFromCharacterJumpingDownForward
                
                gunspark.position = CGPointMake(kBulletDistanceXFromCharacterJumpingDownForward, kBulletDistanceYFromCharacterJumpingDownForward)
            }
            
        } else {
            
            bulletDirection = .BulletForward
            velocity = CGVectorMake(kCharacterBulletSpeedX * playerDirection, 0)
            
            if canJump == true {
                
                x = kBulletDistanceXFromCharacterForward * playerDirection
                y = kBulletDistanceYFromCharacterForward
                
                gunspark.position = CGPointMake(kBulletDistanceXFromCharacterForward, kBulletDistanceYFromCharacterForward)
            } else {
                
                x = kBulletDistanceXFromCharacterJumpingForward * playerDirection
                y = kBulletDistanceYFromCharacterJumpingForward
                
                gunspark.position = CGPointMake(kBulletDistanceXFromCharacterJumpingForward, kBulletDistanceYFromCharacterJumpingForward)
            }
        }
        
        let atlas: SKTextureAtlas = SKTextureAtlas.init(named: bulletType.atlasName)
        sprite = SKSpriteNode.init(texture: atlas.textureNamed(bulletDirection.rawValue))
        sprite.xScale *= playerDirection
        sprite.position = CGPointMake(heroX + x, heroY + y)
        sprite.physicsBody = SKPhysicsBody.init(rectangleOfSize: sprite.size)
        sprite.physicsBody?.categoryBitMask = playingSide.dynamicType.bulletCategoryMask
        sprite.physicsBody?.collisionBitMask = kNoCollisionMask
        sprite.physicsBody?.contactTestBitMask = playingSide.dynamicType.enemyCategoryMask
        sprite.physicsBody?.affectedByGravity = false
        sprite.physicsBody?.velocity = velocity
        sprite.physicsBody?.charge = playingSide.dynamicType.bulletCharge
    }
}
