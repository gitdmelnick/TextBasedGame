//
//  BackgroundComponent.swift
//  TextBasedGame
//
//  Created by Dmitriy Melnichenko on 9/21/16.
//  Copyright © 2016 Dmitriy Melnichenko. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class TerrainComponent: GKComponent {
    
    var nodes: [SKSpriteNode] = []
    
    init(background: SKTexture, foreground: SKTexture) {
        nodes.append(SKSpriteNode(texture: background, color: SKColor.whiteColor(), size: background.size()))
        nodes.append(SKSpriteNode(texture: foreground, color: SKColor.whiteColor(), size: foreground.size()))
        
    }
    
}