//
//  Attributes.swift
//  TextBasedGame
//
//  Created by Dmitriy Melnichenko on 9/16/16.
//  Copyright © 2016 Dmitriy Melnichenko. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class AttributesComponent: GKComponent {
    
    let strenght: Int
    let intelligentce: Int
    let agility: Int
    let vitality: Int
    
    override init() {
        let randomizer = GKRandomDistribution(lowestValue: 1, highestValue: 10)
        self.strenght = randomizer.nextInt()
        self.intelligentce = randomizer.nextInt()
        self.agility = randomizer.nextInt()
        self.vitality = randomizer.nextInt()
    }

}