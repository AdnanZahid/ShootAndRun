//
//  Sheena.swift
//  ShootAndRun
//
//  Created by Adnan Zahid on 7/12/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import SpriteKit

class Sheena: Character {
    
    let localCharacterName: CharacterName = .Sheena
    
    init(x: CGFloat, y: CGFloat, playingSide: PlayingSide) {
        super.init(x: x, y: y, playingSide: playingSide, characterName: localCharacterName)
    }
}
