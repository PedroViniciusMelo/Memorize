//
//  ContentView.swift
//  Memorize
//
//  Created by Pedro Vinícius De Melo Sillva on 06/02/24.
//

import SwiftUI

struct EmojiMemoryView: View {
    let emojis = ["👻", "🕷️", "🎃", "😈", "👹"]
    
    var body: some View {
        ScrollView {
            cards
        }.padding()
    }
    
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(emoji : emojis[index])
                    .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            }
        }
        .foregroundColor(.orange)
    }
    

}

struct CardView : View {
    let emoji : String
    @State var isFaceUp = false
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
        ZStack {
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(emoji).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    EmojiMemoryView()
}
