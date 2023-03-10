//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by ldy on 1/30/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["đĒŦ","âī¸","âī¸","đģ","â¨ī¸","đ˛ī¸","đšī¸","đŊ","đž","đˇ","đĨ","đī¸","đ","âī¸","đ ","đē","đ§­","â°","âī¸","đĄ","đ","đĄ","đ°","đ"]
    
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
