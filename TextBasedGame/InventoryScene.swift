//
//  InventoryScene.swift
//  TextBasedGame
//
//  Created by Dmitriy Melnichenko on 9/14/16.
//  Copyright © 2016 Dmitriy Melnichenko. All rights reserved.
//

import SpriteKit

class InventoryScene: SKScene {
    
    var background: SKSpriteNode!
    var backBtn: SKNode!
    var statsBtn: SKNode!
    var groupBtn: SKNode!
    
    
    
    func createButtons() {
        
        let transition = SceneTransition(currentScene: self.view!)
        
        backBtn = SKButton(defaultButtonImage: "button_top_left", activeButtonImage: "button_top_left_a", text: "back", buttonAction: transition.moveBack)
        backBtn.position = CGPoint(x: background.size.width * 0.145, y: frame.size.height - frame.size.height*0.04)
        backBtn.zPosition = 2
        
        statsBtn = SKButton(defaultButtonImage: "button_center_big", activeButtonImage: "button_center_big_a", text: "stats", buttonAction: transition.moveToStats)
        statsBtn.position = CGPoint(x: background.size.width * 0.44, y: frame.size.height - frame.size.height*0.04)
        statsBtn.zPosition = 2
        
        groupBtn = SKButton(defaultButtonImage: "button_center_big", activeButtonImage: "button_center_big_a", text: "group", buttonAction: transition.moveToGroup)
        groupBtn.position = CGPoint(x: background.size.width * 0.795, y: frame.size.height - frame.size.height*0.04)
        groupBtn.zPosition = 2
        
        addChild(backBtn)
        addChild(statsBtn)
        addChild(groupBtn)
    }
    
    
    func createBackground() {
        background = SKSpriteNode(imageNamed: "frame_big")
        background.anchorPoint = CGPointZero
        background.position = CGPointZero
        background.zPosition = 0
        addChild(background)
    }
    
    override func didMoveToView(view: SKView) {
        print("somethingHappened")
        createBackground()
        createButtons()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func update(currentTime: NSTimeInterval) {

    }
}
