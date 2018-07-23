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
        let playerDirection: CGFloat = type(of: playingSide).playerDirection
        let bulletDirection: BulletDirection
        
        if playerAnimation == .WalkingUpForward {
            
            bulletDirection = .BulletUpForward
            velocity = CGVector(dx: kCharacterBulletSpeedX * playerDirection, dy: kCharacterBulletSpeedY)
            
            if canJump == true {
                
                x = kBulletDistanceXFromCharacterUpForward * playerDirection
                y = kBulletDistanceYFromCharacterUpForward
                
                gunspark.position = CGPoint(x: kBulletDistanceXFromCharacterUpForward, y: kBulletDistanceYFromCharacterUpForward)
            } else {
                
                x = kBulletDistanceXFromCharacterJumpingUpForward * playerDirection
                y = kBulletDistanceYFromCharacterJumpingUpForward
                
                gunspark.position = CGPoint(x: kBulletDistanceXFromCharacterJumpingUpForward, y: kBulletDistanceYFromCharacterJumpingUpForward)
            }
            
        } else if playerAnimation == .WalkingDownForward {
            
            bulletDirection = .BulletDownForward
            velocity = CGVector(dx: kCharacterBulletSpeedX * playerDirection, dy: -kCharacterBulletSpeedY)
            
            if canJump == true {
                
                x = kBulletDistanceXFromCharacterDownForward * playerDirection
                y = kBulletDistanceYFromCharacterDownForward
                
                gunspark.position = CGPoint(x: kBulletDistanceXFromCharacterDownForward, y: kBulletDistanceYFromCharacterDownForward)
            } else {
                
                x = kBulletDistanceXFromCharacterJumpingDownForward * playerDirection
                y = kBulletDistanceYFromCharacterJumpingDownForward
                
                gunspark.position = CGPoint(x: kBulletDistanceXFromCharacterJumpingDownForward, y: kBulletDistanceYFromCharacterJumpingDownForward)
            }
            
        } else {
            
            bulletDirection = .BulletForward
            velocity = CGVector(dx: kCharacterBulletSpeedX * playerDirection, dy: 0)
            
            if canJump == true {
                
                x = kBulletDistanceXFromCharacterForward * playerDirection
                y = kBulletDistanceYFromCharacterForward
                
                gunspark.position = CGPoint(x: kBulletDistanceXFromCharacterForward, y: kBulletDistanceYFromCharacterForward)
            } else {
                
                x = kBulletDistanceXFromCharacterJumpingForward * playerDirection
                y = kBulletDistanceYFromCharacterJumpingForward
                
                gunspark.position = CGPoint(x: kBulletDistanceXFromCharacterJumpingForward, y: kBulletDistanceYFromCharacterJumpingForward)
            }
        }
        
        let atlas: SKTextureAtlas = SKTextureAtlas.init(named: bulletType.atlasName)
        sprite = SKSpriteNode.init(texture: atlas.textureNamed(bulletDirection.rawValue))
        sprite.xScale *= playerDirection
        sprite.position = CGPoint(x: heroX + x, y: heroY + y)
        sprite.physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
        sprite.physicsBody?.categoryBitMask = type(of: playingSide).bulletCategoryMask
        sprite.physicsBody?.collisionBitMask = kNoCollisionMask
        sprite.physicsBody?.contactTestBitMask = type(of: playingSide).enemyCategoryMask
        sprite.physicsBody?.affectedByGravity = false
        sprite.physicsBody?.velocity = velocity
        sprite.physicsBody?.charge = type(of: playingSide).bulletCharge
    }
}
