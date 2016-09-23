//
//  CharacterComponent.swift
//  TextBasedGame
//
//  Created by Dmitriy Melnichenko on 9/23/16.
//  Copyright © 2016 Dmitriy Melnichenko. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class CharacterComponent: GKComponent {
    
    var attacking = true

    override init() {
        super.init()
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        
        super.updateWithDeltaTime(seconds)
        
        //NOTE: Component has no character animations or position changes
        
        if let spriteComponent = entity?.componentForClass(SpriteComponent.self),
            statusComponent = entity?.componentForClass(StatusComponent.self) {
            if attacking {
                spriteComponent.node.texture = SKTexture(imageNamed: "pc_frame_\(statusComponent.status)_0")
            } else {
                spriteComponent.node.texture = SKTexture(imageNamed: "pc_frame_\(statusComponent.status)_0")
            }
        }
     
    }
    
}
