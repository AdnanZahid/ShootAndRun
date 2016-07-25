//
//  BulletTypeA.swift
//  ShootAndRun
//
//  Created by Adnan Zahid on 7/22/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

class BulletTypeA: BulletType {
    
    let localAtlasName: String = kStringBulletTypeA
    
    init() {
        super.init(atlasName: localAtlasName)
    }
}
