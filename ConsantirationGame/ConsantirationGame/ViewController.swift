//
//  ViewController.swift
//  ConsantirationGame
//
//  Created by Abduraxmon on 09/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Consentration(numberOfCards: (cardIndex.count + 1) / 2)
    
    @IBOutlet private weak var flipCountLbl: UILabel!
    @IBOutlet private var cardIndex: [UIButton]!
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLbl.text = "Flip: \(flipCount)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func btnPressed(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardIndex.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            print(cardNumber)
        }
    }
    
    
    @IBAction private func restartPressed(_ sender: UIButton) {
        flipCount = 0
        rePlay()
        game.replay()
    }
    
   private func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.backgroundColor = .orange
            button.setTitle( "", for: .normal)
        } else {
            button.backgroundColor = .white
            button.setTitle( emoji , for: .normal)
        }
    }
    
    private func updateViewFromModel() {
        for index in cardIndex.indices {
            let button = cardIndex[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle( emoji(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .orange
            }
        }
    }
    
    private var emogiImages = ["👻","🎃","🧙‍♀️","🕷","🍬","👺","🐈‍⬛","👿","👹","🦹🏻‍♂️","🧟‍♀️","🧚‍♂️","🧝‍♀️","🧌","🕴","🕴"]
    private var emoji = [Int : String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emogiImages.count > 0 {
            emoji[card.identifier] = emogiImages.remove(at: emogiImages.count.arc4random)
        }
        return emoji[card.identifier] ?? "?"
        
    }
    
    private func rePlay() {
        game.isFinished = true
        for btn in cardIndex.indices {
            cardIndex[btn].backgroundColor = .orange
            cardIndex[btn].setTitle("", for: .normal)
        }
    }
}

extension Int {
    var arc4random : Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
