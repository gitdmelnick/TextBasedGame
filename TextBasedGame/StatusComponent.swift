//
//  State.swift
//  TextBasedGame
//
//  Created by Dmitriy Melnichenko on 9/20/16.
//  Copyright © 2016 Dmitriy Melnichenko. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit


enum Status: Int {
    case Friendly = 1
    case Neutral = 2
    case Hostile = 3
    
    static let allValues = [Friendly, Neutral, Hostile]
}

class StatusComponent: GKComponent {
    let status: Status
    
    init(status: Status) {
        self.status = status
        super.init()
    }
}

