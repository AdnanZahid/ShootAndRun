//
//  GameScene.swift
//  ShootAndRun
//
//  Created by Adnan Zahid on 6/24/16.
//  Copyright (c) 2016 Adnan Zahid. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    ////////////////////////////////////////
    //              VARIABLES             //
    ////////////////////////////////////////
    
    var world: SKNode?
    var enemyWorld: SKNode?
    var distanceCovered: CGFloat = 0
    
    var hero: Character?
    var enemies: Array<Character> = []
    
    var gameOver: Bool = false
    
    var jumpHeight: CGFloat?
    
    ////////////////////////////////////////
    //              FUNCTIONS             //
    ////////////////////////////////////////
    
    override func didMove(to view: SKView) {
        
        makeWorld()
        
        makeBoundaries()
        
        makeHero()
        
        makePlatform(x: frame.width/4)
        
        makePlatform(x: frame.width + frame.width/4)
        
        makeEnemy(x: frame.width + frame.width/4)
        
        makeJoystick()
    }
    
    func makeWorld() {
        
        jumpHeight = frame.height * kFrameHeightToJumpHeightRatio
        
        world = SKNode.init()
        world?.position = frame.origin
        addChild(world!)
        
        enemyWorld = SKNode.init()
        enemyWorld?.position = frame.origin
        world?.addChild(enemyWorld!)
        
        physicsWorld.contactDelegate = self
    }
    
    func makeBoundaries() {
        let borderBody = SKPhysicsBody(edgeFrom: CGPoint(x: 0, y: 0), to: CGPoint(x: frame.width, y: 0))
        borderBody.categoryBitMask = kPlatformCategoryMask
        borderBody.contactTestBitMask = Hero.bodyCategoryMask | Enemy.bodyCategoryMask
        physicsBody = borderBody
    }
    
    func makeHero() {
        hero = Sheena.init(x: kCharacterStartingPositionX, y: frame.height/2, playingSide: Hero.init())
        addChild((hero?.sprite)!)
    }
    
    func makeEnemy(x: CGFloat) {
        let enemy: Character = Ray.init(x: x, y: frame.height/2, playingSide: Enemy.init())
        enemyWorld?.addChild(enemy.sprite)
        
        enemies.append(enemy)
    }
    
    func makePlatform(x: CGFloat) {
        let platform: Platform = Platform.init(x: x, height: frame.height)
        world?.addChild(platform.sprite)
    }
    
    func spawnNewPlatformAndEnemy() {
        if distanceCovered.truncatingRemainder(dividingBy: frame.width) == 0 || distanceCovered.truncatingRemainder(dividingBy: frame.width) == 1 {
            makePlatform(x: distanceCovered + frame.width + frame.width/4)
            makeEnemy(x: distanceCovered + frame.width + frame.width/4)
        }
    }
    
    func moveWorld() {
        world?.position.x -= kGameSpeed
//        enemyWorld?.position.x -= kGameSpeed
        distanceCovered += kGameSpeed
    }
    
    func heroFire() {
        if hero?.shouldFire == true {
            addChild((hero?.getFire())!)
        }
    }
    
    func enemyFire() {
        for enemy in enemies {
            if enemy.shouldFire == true {
                world?.addChild(enemy.getFire())
            }
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            
            firstBody = contact.bodyA
            secondBody = contact.bodyB
            
        } else {
            
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if firstBody.categoryBitMask == Hero.bodyCategoryMask {
        
            if secondBody.categoryBitMask == Enemy.bulletCategoryMask {
    
                hero?.die()
                secondBody.node?.removeFromParent()
                
            } else if secondBody.categoryBitMask == Enemy.bodyCategoryMask
                    || secondBody.categoryBitMask == kDangerCategoryMask {
                
                hero?.die()
                
            } else if secondBody.categoryBitMask == kPlatformCategoryMask {
                
                hero?.walk()
            }
            
        } else if firstBody.categoryBitMask == Enemy.bodyCategoryMask && secondBody.categoryBitMask == Hero.bulletCategoryMask {
            
            secondBody.node?.removeFromParent()
            
            for enemy in enemies {
                
                if enemy.sprite == firstBody.node {
                    enemy.die()
                }
            }
        }
    }
    
    override func update(_ currentTime: CFTimeInterval) {
        
        moveWorld()
        
        spawnNewPlatformAndEnemy()
        
        heroFire()
        
        enemyFire()
        
        #if os(iOS)
            hero?.aim(direction: (joystick?.velocity.y)!)
        #else
            hero?.aim(direction.rawValue)
        #endif
    }
    
    ////////////////////////////////////////
    //            iOS ONLY STUFF          //
    ////////////////////////////////////////
    
    #if os(iOS)
        var joystick: Joystick?
    #endif
    
    func makeJoystick() {
        #if os(iOS)
            joystick = Joystick()
            joystick?.zPosition = kJoystickZPosition
            joystick?.position = CGPoint(x: frame.width + kJoystickPositionX, y: frame.height/2)
            addChild(joystick!)
        #endif
    }
    
    #if os(iOS)
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           
            if gameOver == false {
//                let touch: UITouch = touches.first!
//                let touchLocation: CGPoint = touch.locationInNode(self)
    
//                if touchLocation.x < self.frame.size.width / 2 {
                    hero?.jump(jumpHeight: jumpHeight!)
//                }
                
//                if touchLocation.x >= self.frame.size.width / 2 {
            
//                }
            }
        }
    #endif
    
    ////////////////////////////////////////
    //          macOS ONLY STUFF          //
    ////////////////////////////////////////
    
    #if os(OSX)
        enum Direction: CGFloat {
            case None = 0
            case Down = -1
            case Up = 1
            case Left = -2
            case Right = 2
        }
    
        var direction: Direction = .None
    #endif
    
    #if os(OSX)
        override func keyDown(event: NSEvent) {
            
            if event.keyCode == kUpArrow {
                
                direction = .Up
                
            } else if event.keyCode == kDownArrow {
                
                direction = .Down
                
            } else if event.keyCode == kSpaceBar {
                
                hero?.jump(jumpHeight!)
            }
        }
    
        override func keyUp(event: NSEvent) {
            direction = .None
        }
    #endif
}
