//
//  File.swift
//  Memorize
//
//  Created by Pedro Vinícius De Melo Sillva on 07/02/24.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards : Array<Card>
    
    func choose(card : Card){
        
    }
    
    struct Card {
        var isFaceUp : Bool
        var isMatched : Bool
        var content : CardContent
    }
}
