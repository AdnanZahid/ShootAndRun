//
//  Character.swift
//  ShootAndRun
//
//  Created by Adnan Zahid on 7/1/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import SpriteKit

class Character {
    
    ////////////////////////////////////////
    //              VARIABLES             //
    ////////////////////////////////////////
    
    var playingSide: PlayingSide
    var characterName: CharacterName
    
    let sprite: SKSpriteNode
    let physicsBody: SKPhysicsBody
    
    let gunspark: SKSpriteNode
    
    var dead: Bool = false
    
    var canJump: Bool = true
    
    var shouldFire: Bool = true
    
    var animation: Animation = .Walking
    
    var bulletType: BulletType = BulletTypeD.init()
    var bulletDirection: BulletDirection = .BulletForward
    
    ////////////////////////////////////////
    //              FUNCTIONS             //
    ////////////////////////////////////////
    
    init(x: CGFloat, y: CGFloat, playingSide: PlayingSide, characterName: CharacterName) {
        
        self.playingSide = playingSide
        self.characterName = characterName
        
        sprite = SpriteUtility.createSpriteWithAnimationAtlas(atlasName: "\(characterName)\(animation.rawValue)")
        sprite.xScale *= type(of: playingSide).playerDirection
        sprite.position = CGPoint(x: x, y: y)
        sprite.physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
        sprite.physicsBody?.allowsRotation = false
        sprite.physicsBody?.mass = kCharacterMass
        sprite.physicsBody?.categoryBitMask = type(of: playingSide).bodyCategoryMask
        sprite.physicsBody?.contactTestBitMask = type(of: playingSide).enemyCategoryMask
        
        physicsBody = sprite.physicsBody!
        
        gunspark = SpriteUtility.createSpriteWithAnimationAtlas(atlasName: kGunspark)
        gunspark.xScale *= type(of: playingSide).playerDirection
        gunspark.position = CGPoint(x: kBulletDistanceXFromCharacterForward, y: kBulletDistanceYFromCharacterForward)
        sprite.addChild(gunspark)
        
//        _ = Timer.every(interval: type(of: playingSide).fireFrequency) {
//            
//            self.shouldFire = !self.dead
//        }
        
        sprite.addChild(playingSide.makeForceField())
    }
    
    func aim(direction: CGFloat) {
        
        if dead == false {
            if direction > 0 {
                
                applyAimAnimation(newAnimation: .WalkingUpForward)
            } else if direction < 0 {
                
                applyAimAnimation(newAnimation: .WalkingDownForward)
            } else {
                
                applyAimAnimation(newAnimation: .Walking)
            }
        }
    }
    
    func applyAimAnimation(newAnimation: Animation) {
        
        if animation != newAnimation {
            animation = newAnimation
            
            if canJump == true {
                applyAnimationAtlasToSprite(atlasName: "\(characterName)\(newAnimation.rawValue)", forever: true, completionHandler: {})
            }
        }
    }
    
    func jump(jumpHeight: CGFloat) {
        
        if dead == false && canJump == true {
            canJump = false
            physicsBody.applyImpulse(CGVector(dx: 0, dy: jumpHeight))
            animation = .Jumping
            applyAnimationAtlasToSprite(atlasName: "\(characterName)\(animation.rawValue)", forever: true, completionHandler: {})
        }
    }
    
    func walk() {

        if dead == false && canJump == false {
            canJump = true
            animation = .Walking
            applyAnimationAtlasToSprite(atlasName: "\(characterName)\(animation.rawValue)", forever: true, completionHandler: {})
        }
    }
    
    func die() {
        
//        if dead == false {
//            dead = true
//            gunspark.removeFromParent()
//            animation = playingSide.dynamicType.dyingAnimation
//            
//            if self.playingSide.dynamicType.shouldRemoveAfterDying {
//                
//                applyAnimationAtlasToSprite("\(animation.rawValue)", forever: false, completionHandler: { self.sprite.removeFromParent() })
//            } else {
//                
//                applyAnimationAtlasToSprite("\(characterName)\(animation.rawValue)", forever: false, completionHandler: {})
//            }
//        }
    }
    
    func getFire() -> SKSpriteNode {
        
        let bullet: Bullet = Bullet.init(heroX: sprite.position.x, heroY: sprite.position.y, bulletType: bulletType, playingSide: playingSide, playerAnimation: animation, canJump: canJump, gunspark: gunspark)
        
        shouldFire = false
        
        return bullet.sprite
    }
    
    func applyAnimationAtlasToSprite(atlasName: String, forever: Bool, completionHandler: @escaping () -> Void) {
        
        sprite.applyAnimationAtlasToSprite(atlasName: atlasName, forever: forever, completionHandler: completionHandler)
    }
}
