//
//  AttackComponent.swift
//  TextBasedGame
//
//  Created by Dmitriy Melnichenko on 9/23/16.
//  Copyright © 2016 Dmitriy Melnichenko. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit



class AttackComponent: GKComponent {
    
    let damage: Int
    let destroySelf: Bool
    var lastDamageTime: NSTimeInterval
    let aoe: Bool
    let entityManager: EntityManager
    
    init(damage: Int, destroySelf: Bool, aoe: Bool, entityManager: EntityManager) {
        self.damage = damage
        self.destroySelf = destroySelf
        self.aoe = aoe
        self.lastDamageTime = 0
        self.entityManager = entityManager
        super.init()
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        
        super.updateWithDeltaTime(seconds)
        
        //NOTE: During combat component should check for character state and make according changes to sprites
        
        guard let statusComponent = entity?.componentForClass(StatusComponent.self),
                  spriteComponent = entity?.componentForClass(SpriteComponent.self) else {
            return
        }
        
        var aoeDamageCaused = false
        let enemyEntities = entityManager.entitiesWithStatus(statusComponent.status.oppositeStatus())
        
        for enemyEntity in enemyEntities {
            
            guard let enemySpriteComponent = enemyEntity.componentForClass(SpriteComponent.self),
                  let enemyStatsComponent  = enemyEntity.componentForClass(StatsComponent.self) else {
                continue
            }
            
            if enemyEntity.componentForClass(CharacterComponent)?.attacking == true {
              
                if (aoe) {
                    aoeDamageCaused = true
                } else {
                    lastDamageTime = CACurrentMediaTime()
                }
                
                enemyStatsComponent.takeDamage(damage)
                
                if destroySelf {
                    entityManager.remove(entity!)
                }
                
            }
        }
    }
    
}
