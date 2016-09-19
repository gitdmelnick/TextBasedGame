//
//  SegueManager.swift
//  TextBasedGame
//
//  Created by Dmitriy Melnichenko on 9/19/16.
//  Copyright © 2016 Dmitriy Melnichenko. All rights reserved.
//

import Foundation
import SpriteKit

class SceneTransition: GameScene {
    
    func moveToInventory() {
        let scene: SKScene = InventoryScene(size: self.size)
        self.view?.presentScene(scene)
    }
    
    func moveToStats() {
        let scene: SKScene = StatsScene(size: self.size)
        self.view?.presentScene(scene)
    }
    
    func moveToGroup() {
        let scene: SKScene = GroupScene(size: self.size)
        self.view?.presentScene(scene)
    }
    
    func moveBack() {
        
        let scene = GameScene(size: self.size)
        
        self.view?.presentScene(scene)
        
    }

    
}
