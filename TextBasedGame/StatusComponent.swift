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
    case Player = 1
    case Friendly = 2
    case Hostile = 3
    
    static let allValues = [Player, Friendly, Hostile]
    
    func oppositeStatus() -> Status {
        switch self {
        case .Player:
            return .Hostile
        case .Friendly:
            return .Hostile
        case .Hostile:
            return .Player
        }
    }
    
}

class StatusComponent: GKComponent {
    let status: Status
    
    init(status: Status) {
        self.status = status
        super.init()
    }
}

