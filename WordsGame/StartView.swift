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
    
    var body: some View {
        
        VStack {
            Text("Words Game")
                .padding()
                .font(.custom("AvenirNext-Bold", size: 42 ))
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
            
            TextField("Enter word",
                      text: $bigWord )
            .font(.title2)
            .padding()
            .background(.white)
            .cornerRadius(16)
            .padding(16)
            .padding(.top, 10)
            
            TextField("Player 1",
                      text: $player1)
            .font(.title2)
            .padding()
            .background(.white)
            .cornerRadius(16)
            .padding(.horizontal, 16)
            
            TextField("Player 2",
                      text: $player2 )
            .font(.title2)
            .padding()
            .background(.white)
            .cornerRadius(16)
            .padding(.top, 16)
            .padding(.horizontal, 15)
            
            Button {
                print("Start Button Tapped")
            } label: {
                    Text("Start")
                        .font(.custom("AvenirNext-Bold", size: 30))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("background"))
                }
            
        }.background(Image("background"))
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
