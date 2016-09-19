//
//  StatsScene.swift
//  TextBasedGame
//
//  Created by Dmitriy Melnichenko on 9/14/16.
//  Copyright © 2016 Dmitriy Melnichenko. All rights reserved.
//

import SpriteKit

class StatsScene: SKScene {

    var background: SKSpriteNode!
    var backBtn: SKNode!
    var inventoryBtn: SKNode!
    var groupBtn: SKNode!
    
    let transition = SceneTransition()
    
    
    func createBackButton() {
        
        backBtn = SKButton(defaultButtonImage: "button_top_left", activeButtonImage: "button_top_left_a", text: "back", buttonAction: transition.moveBack)
        backBtn.position = CGPoint(x: background.size.width * 0.145, y: frame.size.height - frame.size.height*0.04)
        backBtn.zPosition = 2
        
        inventoryBtn = SKButton(defaultButtonImage: "button_center_big", activeButtonImage: "button_center_big_a", text: "inventory", buttonAction: transition.moveToInventory)
        inventoryBtn.position = CGPoint(x: background.size.width * 0.44, y: frame.size.height - frame.size.height*0.04)
        inventoryBtn.zPosition = 2
        
        groupBtn = SKButton(defaultButtonImage: "button_center_big", activeButtonImage: "button_center_big_a", text: "group", buttonAction: transition.moveToGroup)
        groupBtn.position = CGPoint(x: background.size.width * 0.795, y: frame.size.height - frame.size.height*0.04)
        groupBtn.zPosition = 2
        
        addChild(backBtn)
        addChild(inventoryBtn)
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
        createBackground()
        createBackButton()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        
    }
    
}
