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
            ScrollView
            {
                ForEach(viewModel.displayRowColor, id:\.self)
                {   line in
                    
                    GuessStack(model: line)
                }
                if(viewModel.gameFinished)
                {
                    FinishedStack
                    {
                        viewModel.FinishGame()
                    }
                }
                
            }
            VStack
            {
                UIPlaerGuessStack(firstGuess: self.viewModel.colorRow[0],
                                  secondGuess: self.viewModel.colorRow[1],
                                  thirdGuess: self.viewModel.colorRow[2],
                                  fourthGuess: self.viewModel.colorRow[3],
                                  resetAction:
                                  {
                                    self.viewModel.ResetPlayerGuess()
                                  },
                                  lockInAction:
                                  {
                                    self.viewModel.LockInPlayerGuess()
                                  })
                HStack(alignment: .center, spacing: 30)
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
                }.frame(minWidth: 300, idealWidth: 100, maxWidth: .infinity, minHeight: 20, idealHeight: 35, maxHeight: 60, alignment: .center)
                
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
