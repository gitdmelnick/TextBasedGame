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
        
        let terrainComponent = TerrainComponent(background: SKTexture(imageNamed: bgImageName), foreground: SKTexture(imageNamed: fgImageName))
       
        terrainComponent.nodes.first?.anchorPoint = CGPointZero
        terrainComponent.nodes.first?.position = position
        terrainComponent.nodes.first?.zPosition = 0
        
        terrainComponent.nodes.last?.anchorPoint = CGPointZero
        terrainComponent.nodes.last?.position = position
        terrainComponent.nodes.last?.zPosition = 1
        
        addComponent(terrainComponent)
        
    }
}
