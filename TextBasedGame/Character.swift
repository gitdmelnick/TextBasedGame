//
//  Character.swift
//  TextBasedGame
//
//  Created by Dmitriy Melnichenko on 9/16/16.
//  Copyright © 2016 Dmitriy Melnichenko. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Character: GKEntity {
    
    init(imageName: String, textureAtlas: String, status: Status) {
        super.init()
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
        let animationComponent = MovementComponent(textureAtlas: textureAtlas, spriteComponent: spriteComponent )

        spriteComponent.node.zPosition = 3
        
        addComponent(spriteComponent)
        addComponent(animationComponent)
        addComponent(StatusComponent(status: status))
        
    }
}
