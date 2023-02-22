//
//  Player.swift
//  WordsGame
//
//  Created by Konstantyn Koroban on 21/02/2023.
//

import Foundation

struct Player {
    
    let name: String
    private(set) var score = 0
    
    mutating func add(score: Int) {
        self.score += score  
    }
}
