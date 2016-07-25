//
//  Ray.swift
//  ShootAndRun
//
//  Created by Adnan Zahid on 7/12/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import SpriteKit

class Ray: Character {
    
    let localCharacterName: CharacterName = .Ray
    
    let bulletType1: BulletType = BulletTypeB.init()
    let bulletType2: BulletType = BulletTypeC.init()
    
    init(x: CGFloat, y: CGFloat, playingSide: PlayingSide) {
        super.init(x: x, y: y, playingSide: playingSide, characterName: localCharacterName)
    }
}
