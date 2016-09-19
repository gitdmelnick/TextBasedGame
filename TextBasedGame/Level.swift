//
//  Level.swift
//  TextBasedGame
//
//  Created by Dmitriy Melnichenko on 9/16/16.
//  Copyright © 2016 Dmitriy Melnichenko. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Level: GKEntity {
    
    init(bgImageName: String, fgImageName: String, position: CGPoint) {
        super.init()
        
        let background = SpriteComponent(texture: SKTexture(imageNamed: bgImageName))
        background.node.anchorPoint = CGPointZero
        background.node.position = position
        background.node.zPosition = 0
        
        let foreground = SpriteComponent(texture: SKTexture(imageNamed: fgImageName))
        foreground.node.anchorPoint = CGPointZero
        foreground.node.position = position
        foreground.node.zPosition = 1
        
        addComponent(background)
        addComponent(foreground)
        
    }
}
