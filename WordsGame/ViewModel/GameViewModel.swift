//
//  GameViewModel.swift
//  WordsGame
//
//  Created by Konstantyn Koroban on 21/02/2023.
//

import Foundation

enum WordError: Error {
    case theSameWord
    case beforeWord
    case litleWord
    case wrongWord
    case underFinedError
}

class GameViewModel: ObservableObject {
    @Published var firstPlayer: Player
    @Published var secondPlayer: Player
    @Published var words = [String]()
    let word: String
    var isFirst = true
    
    init(firstPlayer: Player, secondPlayer: Player , word: String) {
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
        self.word = word.uppercased()
    }
    
    func validation(word: String) throws {
        
        let word = word.uppercased()
        guard word != self.word else {
            print("Not repeat")
            throw WordError.theSameWord
        }
        
        guard !(words.contains(word)) else {
            print("Think")
            throw WordError.beforeWord
        }
        
        guard word.count > 1 else {
            print("Little word")
            throw WordError.litleWord
        }
        
        return
        
    }
    
    func wordToCharacters(word: String) -> [Character] {
        var chars = [Character]()
        for char in word.uppercased() {
            chars.append(char)
        }
        
        return chars
    }
    
    func check(word: String) throws -> Int {
        do {
            try self.validation(word: word)
        } catch {
            throw error
        }
        
        var bigWordArray = wordToCharacters(word: self.word)
        let smallWorsArray = wordToCharacters(word: word)
        var result = ""
        
        for char in smallWorsArray {
            if bigWordArray.contains(char) {
                result.append(char)
                var i = 0
                while bigWordArray[i] != char {
                    i += 1
                }
                bigWordArray.remove(at: i)
                
            } else {
                throw WordError.wrongWord
            }
        }
        
        guard result == word.uppercased() else {
            print("Uknown Error")
            return 0
        }
        
        words.append(result)
        
        if isFirst {
            firstPlayer.add(score: result.count)
        } else {
            secondPlayer.add(score: result.count)
        }
        
        isFirst.toggle()
        
        return result.count
        
    }
    
}
