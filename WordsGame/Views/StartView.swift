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
    
    var body: some View {
        
        VStack {
            
            TitleText(text: "Words Game")
            
            WordsTextField(word: $bigWord, placeholder: "Enter word")
                .padding(16)
                .padding(.top,30)
            
            WordsTextField(word: $player1, placeholder: "Player 1")
                .padding(.horizontal, 16)
            
            WordsTextField(word: $player2, placeholder: "Player 2")
                .padding(.top, 16)
                .padding(.horizontal, 15)
            
            Button {
                isShowedGame.toggle()
            } label: {
                Text("Start")
                    .font(.custom("AvenirNext-Bold", size: 30))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("background"))
            }
            
        }.background(Image("background"))
            .fullScreenCover(isPresented: $isShowedGame) {
                GameView()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
