//
//  ContentView.swift
//  WordsGame
//
//  Created by Konstantyn Koroban on 15/02/2023.
//

import SwiftUI

struct StartView: View {
    @State var bigWord = ""
    @State var player1 = ""
    @State var player2 = ""
    
    @State var isShowedGame = false
    @State var isAlertPresented = false
 
    var body: some View {
        
        VStack {
            
            TitleText(text: "Words Game")
            
            WordsTextField(word: $bigWord, placeholder: "Enter your word")
                .padding(16)
                .padding(.top,30)
            
            WordsTextField(word: $player1, placeholder: "Player 1")
                .padding(.horizontal, 16)
            
            WordsTextField(word: $player2, placeholder: "Player 2")
                .padding(.top, 16)
                .padding(.horizontal, 15)
            
            Button {
                
                if bigWord.count > 7 {
                    isShowedGame.toggle()
                } else {
                    self.isAlertPresented.toggle()
                }
                

            } label: {
                Text("Start")
                    .font(.custom("AvenirNext-Bold", size: 30))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("background"))
            }
            
        }.background(Image("background"))
        
            .alert("Lenght word is small", isPresented: $isAlertPresented, actions: {
                Text("Ok")
            })
            .fullScreenCover(isPresented: $isShowedGame) {
                let nameFirstPlayer = player1 == "" ? "Player 1" : player1
                let nameSecondPlayer = player2 == "" ? "Player 2" : player2
                
                let firstPlayer = Player(name: nameFirstPlayer)
                let secondPlayer = Player(name: nameSecondPlayer)
                
                let gameViewModel = GameViewModel(firstPlayer: firstPlayer, secondPlayer: secondPlayer, word: bigWord)
                
                GameView(viewModel: gameViewModel)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
