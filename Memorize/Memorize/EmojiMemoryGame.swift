//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by ldy on 1/30/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["🪬","⚗️","⌚️","💻","⌨️","🖲️","🕹️","💽","💾","📷","🎥","🎞️","📞","☎️","📠","📺","🧭","⏰","⌛️","📡","🔋","💡","💰","💎"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }}
    
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<Card>{
        model.cards
    }
    
    //Mark: -Intent(s)
    func choose(_ card:Card){
//        objectWillChange.send()
        model.choose(card)
    }
}
