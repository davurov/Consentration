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
    
    private static var idenifierFActory = 0
    
    private static func getUniqueIdenifier() -> Int {
        idenifierFActory += 1
        return self.idenifierFActory
    }
    
    init() {
        self.identifier = Card.getUniqueIdenifier()
    }
    
    // shuffle the cards
    
}
