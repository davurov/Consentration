//
//  ViewController.swift
//  ConsantirationGame
//
//  Created by Abduraxmon on 09/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Consentration(numberOfCards: (cardIndex.count + 1) / 2)
    @IBOutlet weak var flipCountLbl: UILabel!
    @IBOutlet var cardIndex: [UIButton]!
    
    var flipCount = 0 {
        didSet {
            flipCountLbl.text = "Flip: \(flipCount)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardIndex.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            print(cardNumber)
        }
    }
    
    
    @IBAction func restartPressed(_ sender: UIButton) {
        flipCount = 0
        rePlay()
        game.replay()
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.backgroundColor = .orange
            button.setTitle( "", for: .normal)
        } else {
            button.backgroundColor = .white
            button.setTitle( emoji , for: .normal)
        }
    }
    
    func updateViewFromModel() {
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
    
    var emogiImages = ["👻","🎃","🧙‍♀️","🕷","🍬","👺","🐈‍⬛","👿","👹","🦹🏻‍♂️","🧟‍♀️","🧚‍♂️","🧝‍♀️","🧌","🕴","🕴"]
    var emoji = [Int : String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emogiImages.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emogiImages.count)))
            emoji[card.identifier] = emogiImages.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
        
    }
    
    func rePlay() {
        game.isFinished = true
        for btn in cardIndex.indices {
            cardIndex[btn].backgroundColor = .orange
            cardIndex[btn].setTitle("", for: .normal)
        }
    }
}
