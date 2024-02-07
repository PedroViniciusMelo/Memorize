//
//  ContentView.swift
//  Memorize
//
//  Created by Pedro Vinícius De Melo Sillva on 06/02/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🕷️", "🎃", "😈", "👹"]
    @State var emojisCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            
            Spacer()
            
            cardCountAdjusters
        }.padding()
        
    }
    
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<emojisCount, id: \.self) { index in
                CardView(emoji : emojis[index])
                    .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            }
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button (
            action: {
                emojisCount += offset
            }, label: {
                Image(systemName: symbol)
            }
        ).disabled(emojisCount + offset < 1 || emojisCount + offset > emojis.count )
    }
    
    var cardRemover : some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var cardAdder : some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
    var cardCountAdjusters : some View {
        HStack {
            cardRemover
            
            Spacer()
            
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
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
    ContentView()
}
