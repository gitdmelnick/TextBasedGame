//
//  GameScene.swift
//  TextBasedGame
//
//  Created by Dmitriy Melnichenko on 9/13/16.
//  Copyright (c) 2016 Dmitriy Melnichenko. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
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
    
    func initializeButtons() {
        
        inputBtn = SKButton(defaultButtonImage: "button_top_left", activeButtonImage: "button_top_left_a", buttonAction: createCustomInput)
        inputBtn.position = CGPoint(x: UIFrame.size.width * 0.145, y: UIFrame.size.height - UIFrame.size.width * 0.072)
        inputBtn.zPosition = 2
        
        
        inventoryBtn = SKButton(defaultButtonImage: "button_center", activeButtonImage: "button_center_a", buttonAction: createCustomInput)
        inventoryBtn.position = CGPoint(x: UIFrame.size.width * 0.38, y: UIFrame.size.height - UIFrame.size.width * 0.072)
        inventoryBtn.zPosition = 2
        
        statsBtn = SKButton(defaultButtonImage: "button_center", activeButtonImage: "button_center_a", buttonAction: createCustomInput)
        statsBtn.position = CGPoint(x: UIFrame.size.width * 0.616, y: UIFrame.size.height - UIFrame.size.width * 0.072)
        statsBtn.zPosition = 2
        
        groupBtn = SKButton(defaultButtonImage: "button_top_right", activeButtonImage: "button_top_right_a", buttonAction: createCustomInput)
        groupBtn.position = CGPoint(x: UIFrame.size.width * 0.851, y: UIFrame.size.height - UIFrame.size.width * 0.072)
        groupBtn.zPosition = 2
        
        scrollUpBtn = SKButton(defaultButtonImage: "button_scroll_up", activeButtonImage: "button_scroll_up_a", buttonAction: createCustomInput)
        scrollUpBtn.position = CGPoint(x: UIFrame.size.width * 0.915, y: UIFrame.size.height - UIFrame.size.height * 0.4)
        scrollUpBtn.zPosition = 2
        
        scrollDownBtn = SKButton(defaultButtonImage: "button_scroll_down", activeButtonImage: "button_scroll_down_a", buttonAction: createCustomInput)
        scrollDownBtn.position = CGPoint(x: UIFrame.size.width * 0.915, y: UIFrame.size.height - UIFrame.size.height * 0.76)
        scrollDownBtn.zPosition = 2
        
        addChild(inputBtn)
        addChild(inventoryBtn)
        addChild(statsBtn)
        addChild(groupBtn)
        addChild(scrollUpBtn)
        addChild(scrollDownBtn)
        
        
    }
    
    func animateEntity(atlasName: String, entityName: String) -> [SKTexture]{
        let movementAtlas = SKTextureAtlas(named: atlasName)
        var animationFrames = [SKTexture]()
        
        let numImages = movementAtlas.textureNames.count - 1
        for i in 1...numImages {
            let textureName =  "\(entityName)_\(i)"
            animationFrames.append(movementAtlas.textureNamed(textureName))
        }
        return animationFrames
    }
    
    
    func startAnimation() {
        playerCharacterFrames = animateEntity("character_sprites", entityName: "pc_frame")
        foregroundTextures = animateEntity("ground", entityName: "fg_grass")
        playerCharacter.runAction(SKAction.repeatActionForever(
            SKAction.animateWithTextures(playerCharacterFrames,
                timePerFrame: 0.2,
                resize: false,
                restore: true)),
                       withKey:"walkingInPlaceChar")
        foreground.runAction(SKAction.repeatActionForever(
            SKAction.animateWithTextures(foregroundTextures,
                timePerFrame: 0.2,
                resize: false,
                restore: true)),
                                  withKey:"movingGround")
    }
    
    func createForeground() {
        foreground = SKSpriteNode(imageNamed: "fg_grass_1")
        foreground.anchorPoint = CGPointZero
        foreground.position = CGPoint(x: 0, y: UIFrame.size.height)
        foreground.zPosition = 2
        addChild(foreground)
    }
    
    func createBackground() {
        background = SKSpriteNode(imageNamed: "bg_sky_d_1")
        background.anchorPoint = CGPointZero
        background.position = CGPoint(x: 0, y: UIFrame.size.height)
        background.zPosition = 1
        addChild(background)
    }
    
    func createFrame() {
        UIFrame = SKSpriteNode(imageNamed: "frame_small")
        UIFrame.anchorPoint = CGPointZero
        UIFrame.position = CGPointZero
        UIFrame.zPosition = 1
        addChild(UIFrame)
    }
    
    func createCustomInput() {
        
    }
    
    func createCharacter() {
        playerCharacter = SKSpriteNode(imageNamed: "pc_frame_0")
        playerCharacter.position = CGPoint(x: playerCharacter.size.width*2, y: UIFrame.size.height + playerCharacter.size.height)
        playerCharacter.zPosition = 3
        addChild(playerCharacter)
    }
    
    
    override func didMoveToView(view: SKView) {
        createFrame()
        initializeButtons()
        createBackground()
        createForeground()
        createCharacter()
        startAnimation()
        /* Setup your scene here */
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if playerCharacter.hasActions() {
            playerCharacter.removeAllActions()
            foreground.removeAllActions()
        }
        else {
            startAnimation()
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        print("update")
    }
}
