//
//  EntityManager.swift
//  TextBasedGame
//
//  Created by Dmitriy Melnichenko on 9/16/16.
//  Copyright © 2016 Dmitriy Melnichenko. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class EntityManager {
    
    let scene: SKScene!
    var entities = Set<GKEntity>()
    var toRemove = Set<GKEntity>()
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    func add(entity: GKEntity) {
        entities.insert(entity)
        
        if let spriteNode = entity.componentForClass(SpriteComponent.self)?.node {
            scene.addChild(spriteNode)
        }
        else if let spriteNodes = entity.componentForClass(TerrainComponent.self)?.nodes {
            for spriteNode in spriteNodes {
                scene.addChild(spriteNode)
            }
        }
        

    }
    
    
    
    func remove(entity: GKEntity) {
        
        if let spriteNode = entity.componentForClass(SpriteComponent.self)?.node {
            spriteNode.removeFromParent()
        }
        
        toRemove.insert(entity)
        entities.remove(entity)
    }
    
    func entitiesWithStatus(status: Status) -> [GKEntity] {
        
        
        return entities.flatMap{
            entity in
            if let StatusComponent = entity.componentForClass(StatusComponent.self) {
                if StatusComponent.status == status {
                    return entity
                }
            }
            
            return nil
        }
    }
    
    func manageMovement(status: Status) {
        let entities = entitiesWithStatus(status)
        
        for entity in entities {
            let entityNode = entity.componentForClass(SpriteComponent.self)?.node
            if !(entityNode?.hasActions())! {
                let movementComponentTextures = entity.componentForClass(MovementComponent.self)?.playerCharacterTextures
                entityNode?.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(movementComponentTextures!, timePerFrame: 0.5, resize:  false, restore: false)))
            }
            else {
                entityNode?.removeAllActions()
            }
        }
    }
    
}
