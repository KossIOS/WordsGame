//
//  GameView.swift
//  WordsGame
//
//  Created by Konstantyn Koroban on 16/02/2023.
//

import SwiftUI

struct GameView: View {
    
    @State private var word = ""
    
    var body: some View {
        
        VStack(spacing: 16) {
            HStack {
                Button {
                    print("Quit")
                } label: {
                    Text("Exit")
                        .padding(6)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .background(Color("ButtonColor"))
                        .cornerRadius(12)
                        .padding(6)
                        .font(.custom("AvenirNext-Bold", size: 18))
                    
                }
                
                Spacer()
            }
            
            Text("Some Word")
                .font(.custom("AvenirNext-Bold", size: 36))
                .foregroundColor(.white)
            
            HStack(spacing: 12) {
                
                VStack {
                    Text("0")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text("Koss")
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }.padding(20)
                    .frame(width: screen.width / 2.2, height: screen.height / 4)
                    .background(Color(.lightGray))
                    .cornerRadius(26)
                    .shadow(color: .gray, radius: 4)
                
                VStack {
                    Text("0")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text("Alex")
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }.padding(20)
                    .frame(width: screen.width / 2.2,
                           height: screen.height / 4)
                    .background(Color(.lightGray))
                    .cornerRadius(26)
                    .shadow(color: .gray, radius: 4)
            }
            
            WordsTextField(word: $word,
                           placeholder: "Insert your word")
            .padding(.horizontal)
            
            Button {
                print("Ok")
                self.word = ""
            } label: {
                Text("Done!")
                    .padding(12)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color("ButtonColor"))
                    .cornerRadius(12)
                    .font(.custom("AvenirNext-Bold", size: 26))
                    .padding(.horizontal)
            }
            
            Spacer()
            
        }.background(Image("background"))
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}


