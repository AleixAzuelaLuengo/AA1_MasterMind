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
            .frame(width:45, height:45)
    }
}

struct OutComeColorShape: View
{
    let color: Color
    
    var body: some View
    {
        Circle()
            .fill(self.color)
            .frame(width:15, height:15)
    }
}

struct OutCome: View
{
    let outCome: Array<Color>
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                OutComeColorShape(color: outCome[0])
                OutComeColorShape(color: outCome[1])
            }
            HStack
            {
                OutComeColorShape(color: outCome[2])
                OutComeColorShape(color: outCome[3])
            }
        }
    }
}


struct GuessStack: View
{
    let model: GuessModel
    
    var body: some View
    {
        HStack(alignment: .center, spacing: 10)
        {
            Text(String(model.guessNumber))
            GuessColorShape(color: model.guess[0])
            GuessColorShape(color: model.guess[1])
            GuessColorShape(color: model.guess[2])
            GuessColorShape(color: model.guess[3])
            OutCome(outCome: model.outCome)
        }
    }
}
