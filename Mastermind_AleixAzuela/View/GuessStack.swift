//
//  GuessStack.swift
//  Mastermind_AleixAzuela
//
//  Created by AleixAzuela on 9/3/21.
//

import SwiftUI


struct GuessColor
{
    let red: Double
    let green: Double
    let blue: Double
    let opacity: Double
}

struct GuessColorShape: View
{
    let color: GuessColor
    
    var body: some View
    {
        Circle()
            .fill(Color(.sRGB, red: self.color.red , green: self.color.green, blue: self.color.blue, opacity: self.color.opacity))
            .frame(width:62.5, height:62.5)
    }
}


struct GuessStack: View
{
    internal init(firstGuess: GuessColor, secondGuess: GuessColor, thirdGuess: GuessColor, fourthGuess: GuessColor) {
        self.firstGuess = firstGuess
        self.secondGuess = secondGuess
        self.thirdGuess = thirdGuess
        self.fourthGuess = fourthGuess
    }
    
    let firstGuess: GuessColor
    let secondGuess: GuessColor
    let thirdGuess: GuessColor
    let fourthGuess: GuessColor
    
    var body: some View
    {
        HStack
        {
            GuessColorShape(color: self.firstGuess)
            GuessColorShape(color: self.secondGuess)
            GuessColorShape(color: self.thirdGuess)
            GuessColorShape(color: self.fourthGuess)
        }
    }
}
