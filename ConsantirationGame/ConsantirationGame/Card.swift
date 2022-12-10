//
//  Card.swift
//  ConsantirationGame
//
//  Created by Abduraxmon on 09/12/22.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var idenifierFActory = 0
    
    static func getUniqueIdenifier() -> Int {
        idenifierFActory += 1
        return self.idenifierFActory
    }
    
    init() {
        self.identifier = Card.getUniqueIdenifier()
    }
    
    // shuffle the cards
    
}
