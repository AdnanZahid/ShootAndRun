//
//  Constants.swift
//  ShootAndRun
//
//  Created by Adnan Zahid on 7/1/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import SpriteKit


////////////////////////////////////////
//              ENUMS                 //
////////////////////////////////////////


let kSpaceBar: UInt16   = 49
let kLeftArrow: UInt16  = 123
let kRightArrow: UInt16 = 124
let kDownArrow: UInt16  = 125
let kUpArrow: UInt16    = 126


////////////////////////////////////////
//              ENUMS                 //
////////////////////////////////////////


enum CharacterName: String {
    case Ray
    case Sheena
}

enum Animation: String {
    case None
    case Walking
    case WalkingUpForward
    case WalkingDownForward
    case Jumping
    case Dying
    case Explosion
}

enum BulletDirection: String {
    case BulletForward
    case BulletUpForward
    case BulletDownForward
}


////////////////////////////////////////
//              MASKS                 //
////////////////////////////////////////


let kNoCollisionMask: UInt32 = 0
let kPlatformCategoryMask: UInt32 = 0x1 << 29
let kDangerCategoryMask: UInt32 = 0x1 << 30
let kBoundaryCategoryMask: UInt32 = 0x1 << 31


////////////////////////////////////////
//              PLATFORM              //
////////////////////////////////////////


let kGameSpeed: CGFloat = 2
let kPlatformHeight: UInt32 = 50
let kTypesOfBlocks: UInt32 = 4
let kMinimumBlocksForPlatform: UInt32 = 11
let kMaximumBlocksForPlatform: UInt32 = 13


////////////////////////////////////////
//              Character             //
////////////////////////////////////////


let kFrameHeightToJumpHeightRatio: CGFloat = 2
let kCharacterStartingPositionX: CGFloat = 180
let kCharacterMass: CGFloat = 1
let kNoneAnimation: String = "None"


////////////////////////////////////////
//              BULLET                //
////////////////////////////////////////


let kStringBulletTypeA: String = "BulletTypeA"
let kStringBulletTypeB: String = "BulletTypeB"
let kStringBulletTypeC: String = "BulletTypeC"
let kStringBulletTypeD: String = "BulletTypeD"
let kStringBulletTypeE: String = "BulletTypeE"

let kGunspark: String = "Gunspark"

let kCharacterBulletSpeedX: CGFloat = 500
let kCharacterBulletSpeedY: CGFloat = 500

let kBulletDistanceXFromCharacterForward: CGFloat = 21
let kBulletDistanceYFromCharacterForward: CGFloat = 6

let kBulletDistanceXFromCharacterUpForward: CGFloat = 16
let kBulletDistanceYFromCharacterUpForward: CGFloat = 23

let kBulletDistanceXFromCharacterDownForward: CGFloat = 16
let kBulletDistanceYFromCharacterDownForward: CGFloat = -13

let kBulletDistanceXFromCharacterJumpingForward: CGFloat = 15
let kBulletDistanceYFromCharacterJumpingForward: CGFloat = 0

let kBulletDistanceXFromCharacterJumpingUpForward: CGFloat = 12
let kBulletDistanceYFromCharacterJumpingUpForward: CGFloat = 10

let kBulletDistanceXFromCharacterJumpingDownForward: CGFloat = 12
let kBulletDistanceYFromCharacterJumpingDownForward: CGFloat = -10


////////////////////////////////////////
//              JOYSTICK              //
////////////////////////////////////////


let kJoystickPositionX: CGFloat = -80
let kJoystickDiameter: CGFloat = 100
let kJoystickZPosition: CGFloat = 100
