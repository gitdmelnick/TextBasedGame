//
//  GroupScene.swift
//  TextBasedGame
//
//  Created by Dmitriy Melnichenko on 9/14/16.
//  Copyright © 2016 Dmitriy Melnichenko. All rights reserved.
//

import SpriteKit

class GroupScene: SKScene {

    var background: SKSpriteNode!
    
    func createBackground() {
        background = SKSpriteNode(imageNamed: "frame_big")
        background.anchorPoint = CGPointZero
        background.position = CGPointZero
        background.zPosition = 0
        addChild(background)
    }
    
    override func didMoveToView(view: SKView) {
        createBackground()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        
    }
    
}
