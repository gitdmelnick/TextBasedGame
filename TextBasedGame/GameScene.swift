//
//  GameScene.swift
//  TextBasedGame
//
//  Created by Dmitriy Melnichenko on 9/13/16.
//  Copyright (c) 2016 Dmitriy Melnichenko. All rights reserved.
//

import SpriteKit
import UIKit

class GameScene: SKScene, UITextFieldDelegate {
    
    var entityManager: EntityManager!
    var inventoryBtn: SKNode!
    var statsBtn: SKNode!
    var groupBtn: SKNode!
    var inputBtn: SKNode!
    var scrollUpBtn: SKNode!
    var scrollDownBtn: SKNode!
    
    var UIFrame: SKSpriteNode!
    var foreground: SKSpriteNode!
    var background: SKSpriteNode!
    var playerCharacter: SKSpriteNode!
    
    var playerCharacterFrames: [SKTexture]!
    var foregroundTextures: [SKTexture]!
    
    var textField: UITextField!
    
    var playerArr: [Character]?
    
    func initializeButtons() {
        
        let transition = SceneTransition(currentScene: self.view!)
        
        inputBtn = SKButton(defaultButtonImage: "button_top_left", activeButtonImage: "button_top_left_a", text: "Input", buttonAction: activateTextfield)
        inputBtn.position = CGPoint(x: UIFrame.size.width * 0.145, y: UIFrame.size.height - UIFrame.size.width * 0.072)
        inputBtn.zPosition = 2
        
        
        inventoryBtn = SKButton(defaultButtonImage: "button_center", activeButtonImage: "button_center_a", text: "Inventory", buttonAction: transition.moveToInventory)
        inventoryBtn.position = CGPoint(x: UIFrame.size.width * 0.38, y: UIFrame.size.height - UIFrame.size.width * 0.072)
        inventoryBtn.zPosition = 2
        
        statsBtn = SKButton(defaultButtonImage: "button_center", activeButtonImage: "button_center_a", text: "Stats", buttonAction: transition.moveToStats)
        statsBtn.position = CGPoint(x: UIFrame.size.width * 0.616, y: UIFrame.size.height - UIFrame.size.width * 0.072)
        statsBtn.zPosition = 2
        
        groupBtn = SKButton(defaultButtonImage: "button_top_right", activeButtonImage: "button_top_right_a", text: "Group", buttonAction: transition.moveToGroup)
        groupBtn.position = CGPoint(x: UIFrame.size.width * 0.851, y: UIFrame.size.height - UIFrame.size.width * 0.072)
        groupBtn.zPosition = 2
        
        scrollUpBtn = SKButton(defaultButtonImage: "button_scroll_up", activeButtonImage: "button_scroll_up_a", buttonAction: scrollUp)
        scrollUpBtn.position = CGPoint(x: UIFrame.size.width * 0.915, y: UIFrame.size.height - UIFrame.size.height * 0.4)
        scrollUpBtn.zPosition = 2
        
        scrollDownBtn = SKButton(defaultButtonImage: "button_scroll_down", activeButtonImage: "button_scroll_down_a", buttonAction: scrollDown)
        scrollDownBtn.position = CGPoint(x: UIFrame.size.width * 0.915, y: UIFrame.size.height - UIFrame.size.height * 0.76)
        scrollDownBtn.zPosition = 2
        
        addChild(inputBtn)
        addChild(inventoryBtn)
        addChild(statsBtn)
        addChild(groupBtn)
        addChild(scrollUpBtn)
        addChild(scrollDownBtn)
        
    }
    
    func scrollUp() {
        
    }
    
    func scrollDown() {
        
    }
    
    func createTextField() {
        textField = UITextField()
        textField.borderStyle = UITextBorderStyle.None
        textField.textColor = UIColor.whiteColor()
        textField.font = UIFont(name: "munrosmall", size: 48)
        textField.frame = CGRectMake(view!.bounds.width/3, view!.bounds.height / 3, 300, 40)
        textField.userInteractionEnabled = false
        textField.tintColor = UIColor.whiteColor()
        
        textField.delegate = self
        self.view?.addSubview(textField)
    }
    
    func activateTextfield() {
        textField.userInteractionEnabled = true
        textField.becomeFirstResponder()
    }
    
    func createFrame() {
        UIFrame = SKSpriteNode(imageNamed: "frame_small")
        UIFrame.anchorPoint = CGPointZero
        UIFrame.position = CGPointZero
        UIFrame.zPosition = 1
        addChild(UIFrame)
    }
    
    
    override func didMoveToView(view: SKView) {
        createTextField()
        entityManager = EntityManager(scene: self)
        createFrame()
        initializeButtons()
        
        let level = Level(bgImageName: "bg_sky_d_1", fgImageName: "fg_grass_1", position: CGPoint(x: 0, y: UIFrame.frame.size.height))
        entityManager.add(level)
        
        let playerCharacter = Character(imageName: "pc_frame_0", textureAtlas: "character_sprites", status: .Friendly)
        let playerNode = playerCharacter.componentForClass(SpriteComponent.self)?.node
        playerNode?.position = CGPoint(x: (playerNode?.size.width)! * 2, y: UIFrame.frame.size.height + level.componentForClass(SpriteComponent.self)!.node.frame.size.height/2)
        playerArr?.append(playerCharacter)
        entityManager.add(playerCharacter)
        /* Setup your scene here */
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.text = ""
        return true
    }
    
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        entityManager.manageMovement(.Friendly)
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {

    }
   
    override func update(currentTime: CFTimeInterval) {

    }
}
