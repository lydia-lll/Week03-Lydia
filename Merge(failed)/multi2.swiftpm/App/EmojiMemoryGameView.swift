//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by ldy on 1/28/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    var emojis = ["🪬","⚗️","⌚️","💻","⌨️","🖲️","🕹️","💽","💾","📷","🎥","🎞️","📞","☎️","📠","📺","🧭","⏰","⌛️","📡","🔋","💡","💰","💎"]
    @State var emojiCount = 2
    var body: some View {
        AspectVGrid(items: game.cards, aspectRacio: 2/3){ card in
            if card.isMatched && !card.isFaceUp{
                Rectangle().opacity(0)
            }else{
                Cardview(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            .padding(.horizontal)
        }
    }
    
    struct Cardview: View{
        let card: EmojiMemoryGame.Card
        
        var body: some View {
            GeometryReader { geometry in
                ZStack{
                    let shape = RoundedRectangle(cornerRadius: 20)
                    if card.isFaceUp{
                        shape.fill().foregroundColor(.white)
                        shape.strokeBorder(lineWidth: 3)
                        Pies(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                            .padding(5).opacity(0.5)
                        Text(card.content).font(Font.system(size:min(geometry.size.width,geometry.size.height) * 0.8))
                    }else if card.isMatched{
                        shape.opacity(0)
                    }else{
                        shape.fill()
                    }
                }
            }
        }
    }
    
    struct EmojiMemoryGameView_Previews: PreviewProvider {
        static var previews: some View {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(game: game)
            
        }
    }
//    private func font(in size: CGSize) -> Font{
//        Font.style()
//    }
    
    private struct DrawingConstants{
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.7
    }

