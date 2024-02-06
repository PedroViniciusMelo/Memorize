//
//  ContentView.swift
//  Memorize
//
//  Created by Pedro Vinícius De Melo Sillva on 06/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
           CardView(isFaceUp: true)
           CardView(isFaceUp: false)
           CardView(isFaceUp: true)
           CardView(isFaceUp: false)
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView : View {
    var isFaceUp : Bool = false
    var body: some View {
        if isFaceUp {
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            }
        } else {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.orange)
            
        }
    }
}

#Preview {
    ContentView()
}
