//
//  GuessStack.swift
//  Mastermind_AleixAzuela
//
//  Created by AleixAzuela on 9/3/21.
//

import SwiftUI


struct GuessColorShape: View
{
    let color: Color
    
    var body: some View
    {
        Circle()
            .fill(self.color)
            .frame(width:62.5, height:62.5)
    }
}


struct GuessStack: View
{
    let firstGuess: Color
    let secondGuess: Color
    let thirdGuess: Color
    let fourthGuess: Color
    
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
