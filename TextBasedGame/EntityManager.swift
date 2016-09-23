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
    
    lazy var componentSystems: [GKComponentSystem] = {
        let attackSystem = GKComponentSystem(componentClass: AttackComponent.self)
        let characterSystem = GKComponentSystem(componentClass: CharacterComponent.self)
        return [attackSystem, characterSystem]
    }()
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    func add(entity: GKEntity) {
        entities.insert(entity)
        
        for componentSystem in componentSystems {
            componentSystem.addComponentWithEntity(entity)
        }
        
        if let spriteNode = entity.componentForClass(SpriteComponent.self)?.node {
            scene.addChild(spriteNode)
        }
      
    }
    
    func addLevel(entity: GKEntity) {
        if let spriteNodes = entity.componentForClass(TerrainComponent.self)?.nodes {
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
