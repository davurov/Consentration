//
//  Consentration.swift
//  ConsantirationGame
//
//  Created by Abduraxmon on 09/12/22.
//

import Foundation

class Consentration {
    
    var cards = [Card]()
    var numOfonlyFaceUp: Int?
    var isFinished = false
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = numOfonlyFaceUp, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                numOfonlyFaceUp = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                numOfonlyFaceUp = index
            }
        }
    }
    
    func replay() {
        if isFinished {
            for index in cards.indices {
                cards[index].isMatched = false
                cards[index].isFaceUp = false
            }
            cards.shuffle()
        }
        isFinished = false
    }
    
    init(numberOfCards: Int) {
        for _ in 1...numberOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}
