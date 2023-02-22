//
//  GameView.swift
//  WordsGame
//
//  Created by Konstantyn Koroban on 16/02/2023.
//

import SwiftUI

struct GameView: View {
    
    @State private var word = ""
    var viewModel: GameViewModel
    @State private var confirmPresent = false
    @State private var isAlertPresent = false
    @State var alertText = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(spacing: 16) {
            HStack {
                Button {
                    confirmPresent.toggle()
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
            
            Text(viewModel.word)
                .font(.custom("AvenirNext-Bold", size: 36))
                .foregroundColor(.white)
            
            HStack(spacing: 12) {
                
                VStack {
                    Text("\(viewModel.firstPlayer.score)")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text("\(viewModel.firstPlayer.name)")
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }.padding(20)
                    .frame(width: screen.width / 2.2, height: screen.height / 4)
                    .background(Color(.lightGray))
                    .cornerRadius(26)
                    .shadow(color: viewModel.isFirst ? .red: .clear, radius: 6)
                
                VStack {
                    Text("\(viewModel.secondPlayer.score)")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text("\(viewModel.secondPlayer.name)")
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }.padding(20)
                    .frame(width: screen.width / 2.2,
                           height: screen.height / 4)
                    .background(Color(.lightGray))
                    .cornerRadius(26)
                    .shadow(color: viewModel.isFirst ? .clear : .purple, radius: 6)
            }
            
            WordsTextField(word: $word,
                           placeholder: "Insert your word")
            .padding(.horizontal)
            
            Button {
                
                var score = 0
                do {
                    try score = viewModel.check(word: word)
                } catch WordError.beforeWord {
                    alertText = ("Think")
                    isAlertPresent.toggle()
                } catch WordError.litleWord {
                    alertText = ("Little word")
                    isAlertPresent.toggle()
                } catch WordError.theSameWord {
                    alertText = ("This is word used")
                    isAlertPresent.toggle()
                } catch WordError.wrongWord {
                    alertText = ("Wrong word")
                    isAlertPresent.toggle()
                } catch {
                    alertText = ("Uknown Error")
                    isAlertPresent.toggle()
                }
                
                
                if score > 1 {
                    self.word = ""
                }
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
            .confirmationDialog("You want to quit the game?", isPresented: $confirmPresent, titleVisibility: .visible) {
                Button( role: .destructive) {
                    self.dismiss()
                } label: {
                    Text("Yes")
                }
                
                Button( role: .cancel) { } label: {
                    Text("No")
                }
                
            }
            .alert(alertText, isPresented: $isAlertPresent) {
                Text("Ok, understand")
            }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(firstPlayer: Player(name: "Alex"), secondPlayer: Player(name: "Koss"), word: "Argument"))
    }
}


