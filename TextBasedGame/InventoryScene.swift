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
    
    func createBackButton() {
        backBtn = SKButton(defaultButtonImage: "button_top_left", activeButtonImage: "button_top_left_a", buttonAction: testFunc)
        backBtn.position = CGPoint(x: background.size.width * 0.145, y: frame.size.height - frame.size.height*0.04)
        backBtn.zPosition = 2
        
        addChild(backBtn)
    }
    
    func testFunc() {
        
        let scene = GameScene(size: self.size)
        
        self.view?.presentScene(scene)
        
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
