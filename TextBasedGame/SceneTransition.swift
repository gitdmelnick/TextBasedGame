//
//  SegueManager.swift
//  TextBasedGame
//
//  Created by Dmitriy Melnichenko on 9/19/16.
//  Copyright © 2016 Dmitriy Melnichenko. All rights reserved.
//

import Foundation
import SpriteKit

class SceneTransition: SKScene {
    
    var currentScene: SKView?
    
    func moveToInventory() {
        let scene: SKScene = InventoryScene(size: self.size)
        currentScene?.presentScene(scene)
    }
    
    func moveToStats() {
        let scene: SKScene = StatsScene(size: self.size)
        currentScene?.presentScene(scene)
    }
    
    func moveToGroup() {
        let scene: SKScene = GroupScene(size: self.size)
        currentScene?.presentScene(scene)
    }
    
    func moveBack() {
        let scene = GameScene(size: self.size)
        currentScene?.presentScene(scene)
        
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }

    init(size: CGSize, currentScene: SKView) {
        super.init()
        self.currentScene = currentScene
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
