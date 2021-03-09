//
//  GuessColor.swift
//  Mastermind_AleixAzuela
//
//  Created by Alumne on 9/3/21.
//

import SwiftUI

struct yu: View {
    let red: Double
    let green: Double
    let blue: Double
    let opacity: Double
    
    var body: some View {
        Text("")
            .padding()
            .background(Color(.sRGB, red: self.red , green: self.green, blue: self.blue, opacity: self.opacity))
            .cornerRadius(30)
            
    }
}
