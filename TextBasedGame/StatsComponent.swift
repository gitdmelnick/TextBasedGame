//
//  HealthComponent.swift
//  TextBasedGame
//
//  Created by Dmitriy Melnichenko on 9/23/16.
//  Copyright © 2016 Dmitriy Melnichenko. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class StatsComponent: GKComponent {
    
    var hitPoints: Int
    let meleeDamage: Int
    let magicDamage: Int
    let entityManager: EntityManager
    
    init(attributesComponent: AttributesComponent, entityManager: EntityManager) {
        hitPoints = 15 + attributesComponent.strenght + (2 * attributesComponent.vitality)
        meleeDamage = 2 + (2 * attributesComponent.strenght) + (attributesComponent.agility / 2)
        magicDamage = 2 + (2 * attributesComponent.intelligentce) + (attributesComponent.agility / 2)
        self.entityManager = entityManager
    }
    
    func takeDamage(damage: Int) -> Bool {
        hitPoints = max(hitPoints - damage,  Int(Double(hitPoints) - Double(damage) * 0.8))
    
        if hitPoints == 0 {
            if let entity = entity {
                //NOTE: Currently removes any entity no matter if PC or NPC. 
                let characterComponent = entity.componentForClass(CharacterComponent.self)
                if characterComponent == nil {
                    entityManager.remove(entity)
                }
            }
        }
        
        return hitPoints == 0
    }
}
