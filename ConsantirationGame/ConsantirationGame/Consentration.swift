//
//  Consentration.swift
//  ConsantirationGame
//
//  Created by Abduraxmon on 09/12/22.
//

import Foundation

class Consentration {
    
    private(set) var cards = [Card]()
    
    private var numOfonlyFaceUp: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    
    var isFinished = false
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "max index is \(cards.indices.count) you entered \(index)")
        if !cards[index].isMatched {
            if let matchIndex = numOfonlyFaceUp, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
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
