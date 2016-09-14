//
//  SKButton.swift
//  TextBasedGame
//
//  Created by Dmitriy Melnichenko on 9/13/16.
//  Copyright © 2016 Dmitriy Melnichenko. All rights reserved.
//

import SpriteKit

class SKButton: SKNode {
    var defaultButton = SKSpriteNode()
    var activeButton = SKSpriteNode()
    var action: () -> Void
    
    init(defaultButtonImage: String, activeButtonImage: String, buttonAction: () -> Void) {
        defaultButton = SKSpriteNode(imageNamed: defaultButtonImage)
        activeButton = SKSpriteNode(imageNamed:  activeButtonImage)
        activeButton.hidden = true
        action = buttonAction
        
        super.init()
        
        userInteractionEnabled = true
        addChild(defaultButton)
        addChild(activeButton)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        activeButton.hidden = false
        defaultButton.hidden = true
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch: UITouch = touches.first! as UITouch
        let location: CGPoint = touch.locationInNode(self)
        
        if defaultButton.containsPoint(location) {
            activeButton.hidden = false
            defaultButton.hidden = true
        } else {
            activeButton.hidden = true
            defaultButton.hidden = false
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch: UITouch = touches.first! as UITouch
        let location: CGPoint = touch.locationInNode(self)
        
        if defaultButton.containsPoint(location) {
            action()
        }
        
        activeButton.hidden = true
        defaultButton.hidden = false
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
}