//
//  ContentView.swift
//  Mastermind_AleixAzuela
//
//  Created by AleixAzuela on 9/3/21.
//

import SwiftUI

struct ContentView: View
{
    var body: some View
    {
        VStack
        {
            GuessStack(firstGuess: GuessColor(red: 0.5, green: 0.5, blue:0.5, opacity:1)
                       ,secondGuess: GuessColor(red: 0.5, green: 0.5, blue:0.5, opacity:1)
                       ,thirdGuess: GuessColor(red: 0.5, green: 0.5, blue:0.5, opacity:1)
                       ,fourthGuess: GuessColor(red: 0.5, green: 0.5, blue:0.5, opacity:1))
            HStack
            {
                ColorButton(red: 1, green: 0, blue:0, opacity:1 )
                ColorButton(red: 0, green: 0, blue:0, opacity:1 )
                ColorButton(red: 0, green: 1, blue:0, opacity:1 )
                ColorButton(red: 0, green: 0, blue:1, opacity:1 )
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
