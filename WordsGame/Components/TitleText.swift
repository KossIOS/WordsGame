//
//  TitleText.swift
//  WordsGame
//
//  Created by Konstantyn Koroban on 15/02/2023.
//

import SwiftUI

struct TitleText: View {
    @State var text : String
    
    var body: some View {
         Text(text)
            .padding()
            .font(.custom("AvenirNext-Bold", size: 42 ))
            .cornerRadius(16)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
        
    }
}

struct TitleText_Previews: PreviewProvider {
    static var previews: some View {
        TitleText(text: "Magnitification")
    }
}
