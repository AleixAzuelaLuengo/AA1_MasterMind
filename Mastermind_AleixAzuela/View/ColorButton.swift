//
//  ColorButton.swift
//  Mastermind_AleixAzuela
//
//  Created by AleixAzuela on 9/3/21.
//

import SwiftUI

struct ColorButton: View {
    let red: Double
    let green: Double
    let blue: Double
    let opacity: Double
    
    var body: some View {
        Button("", action: {  })
            .frame(width: 30, height: 30, alignment: .center)
            .padding()
            .background(Color(.sRGB, red: self.red , green: self.green, blue: self.blue, opacity: self.opacity))
            .foregroundColor(.white)
            .font(.title)
            .cornerRadius(30)
    }
}
