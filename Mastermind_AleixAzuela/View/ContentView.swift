//
//  ContentView.swift
//  Mastermind_AleixAzuela
//
//  Created by AleixAzuela on 9/3/21.
//

import SwiftUI

struct ContentView: View
{
    @ObservedObject var viewModel = MasterMindViewModel()
    
    var body: some View
    {
        VStack
        {
            GuessStack(firstGuess: self.viewModel.displayRowColor[0][0]
                       ,secondGuess: self.viewModel.displayRowColor[0][1]
                       ,thirdGuess: self.viewModel.displayRowColor[0][2]
                       ,fourthGuess: self.viewModel.displayRowColor[0][3])
            HStack
            {
                ColorButton(color : Color.red)
                {
                    self.viewModel.AddGuess(colorGuessed: Color.red)
                }
                ColorButton(color :Color.black)
                {
                    self.viewModel.AddGuess(colorGuessed: Color.black)
                }
                ColorButton(color :Color.green)
                {
                    self.viewModel.AddGuess(colorGuessed: Color.green)
                }
                ColorButton(color :Color.blue)
                {
                    self.viewModel.AddGuess(colorGuessed: Color.blue)
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
