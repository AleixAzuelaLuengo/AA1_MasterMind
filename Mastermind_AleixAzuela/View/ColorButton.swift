//
//  ColorButton.swift
//  Mastermind_AleixAzuela
//
//  Created by AleixAzuela on 9/3/21.
//

import SwiftUI

struct ColorButton: View {
    let color : Color
    let action: () -> Void
    
    var body: some View {
        Button("    ", action: { action() })
            .frame(width: 20, height: 20, alignment: .center)
            .padding()
            .background(color)
            .cornerRadius(30)
    }
}
