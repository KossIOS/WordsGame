//
//  WordsTextField.swift
//  WordsGame
//
//  Created by Konstantyn Koroban on 16/02/2023.
//

import SwiftUI

struct WordsTextField: View {
    
    @State var word: Binding<String>
    var placeholder: String
    
    var body: some View {
        TextField(placeholder,
                  text: word )
        .font(.title2)
        .padding()
        .background(.white)
        .cornerRadius(16)
    }
}


