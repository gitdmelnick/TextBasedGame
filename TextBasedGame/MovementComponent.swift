//
//  AnimationComponent.swift
//  TextBasedGame
//
//  Created by Dmitriy Melnichenko on 9/16/16.
//  Copyright © 2016 Dmitriy Melnichenko. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class MovementComponent: GKComponent {
    
    
    
    var playerCharacterTextures: [SKTexture] = []
    var spriteComponent: SpriteComponent?
    
    init(textureAtlas: String, spriteComponent: SpriteComponent) {
        super.init()
        self.spriteComponent = spriteComponent
        let movementAtlas = SKTextureAtlas(named: textureAtlas)
        for i in 1...2 {
            let textureName =  "pc_frame_\(i)"
            let temp = movementAtlas.textureNamed(textureName)
            self.playerCharacterTextures.append(temp)
        }
    }

}
