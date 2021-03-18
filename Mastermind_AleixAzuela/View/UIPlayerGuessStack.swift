//
//  UIPlayerGuessStack.swift
//  Mastermind_AleixAzuela
//
//  Created by Alumne on 16/3/21.
//

import SwiftUI

struct UIGuessColorShape: View
{
    let color: Color
    
    var body: some View
    {
        Circle()
            .fill(self.color)
            .frame(width:45, height:45)

    }
}

struct ResetButton: View
{
    let action: () -> Void
    
    var body: some View {
        Button("X", action: { action() })
            .frame(width: 15, height: 15, alignment: .center)
            .padding()
            .background(Color.white)
            .border(Color.red, width: 2)
            .foregroundColor(.red)
            .cornerRadius(30)
    }
}

struct LockInGuess: View
{
    let action: () -> Void
    
    var body: some View {
        Button("✓", action: { action() })
            .frame(width: 15, height: 15, alignment: .center)
            .padding()
            .background(Color.white)
            .foregroundColor(.green)
            .border(Color.green, width: 2)
            .cornerRadius(30)
    }
}

struct UIPlaerGuessStack: View
{
    let firstGuess: Color
    let secondGuess: Color
    let thirdGuess: Color
    let fourthGuess: Color
    let resetAction: () -> Void
    let lockInAction: () -> Void
    var body: some View
    {
        HStack
        {
            ResetButton(action: self.resetAction)
            UIGuessColorShape(color: self.firstGuess)
            UIGuessColorShape(color: self.secondGuess)
            UIGuessColorShape(color: self.thirdGuess)
            UIGuessColorShape(color: self.fourthGuess)
            LockInGuess(action: self.lockInAction)
        }
    }
}
