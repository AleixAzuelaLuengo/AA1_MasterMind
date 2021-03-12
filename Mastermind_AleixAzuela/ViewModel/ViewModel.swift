//
//  ViewModel.swift
//  Mastermind_AleixAzuela
//
//  Created by AleixAzuela on 9/3/21.
//

import Foundation
import SwiftUI
import Combine

enum Guess
{
    case black
    case green
    case red
    case blue
}

protocol MasterMindViewModelProtocol
{
    func GenerateGuess()
    func CheckPlayerGuess()
}

class MasterMindViewModel: MasterMindViewModelProtocol,
                           ObservableObject
{
    @Published var displayRowColor: Array<Array<Color>> =
        Array<Array<Color>>(arrayLiteral: Array<Color>(arrayLiteral: Color.gray,Color.gray,Color.gray,Color.gray),
                                          Array<Color>(arrayLiteral: Color.gray,Color.gray,Color.gray,Color.gray),
                                          Array<Color>(arrayLiteral: Color.gray,Color.gray,Color.gray,Color.gray),
                                          Array<Color>(arrayLiteral: Color.gray,Color.gray,Color.gray,Color.gray),
                                          Array<Color>(arrayLiteral: Color.gray,Color.gray,Color.gray,Color.gray),
                                          Array<Color>(arrayLiteral: Color.gray,Color.gray,Color.gray,Color.gray),
                                          Array<Color>(arrayLiteral: Color.gray,Color.gray,Color.gray,Color.gray),
                                          Array<Color>(arrayLiteral: Color.gray,Color.gray,Color.gray,Color.gray),
                                          Array<Color>(arrayLiteral: Color.gray,Color.gray,Color.gray,Color.gray),
                                          Array<Color>(arrayLiteral: Color.gray,Color.gray,Color.gray,Color.gray),
                                          Array<Color>(arrayLiteral: Color.gray,Color.gray,Color.gray,Color.gray),
                                          Array<Color>(arrayLiteral: Color.gray,Color.gray,Color.gray,Color.gray))
    
    
    public var finalGuess: GuessModel =  GuessModel()
    public var playerGuess: GuessModel =  GuessModel()
    private var indexInGuess : Int = 0
    private var round : Int = 0
    private var guessFinished: Bool = false
    private var colorRow: Array<Color> = Array()
    
    public func GenerateGuess()
    {
        var temp : Array<Color> = Array<Color>()
        for index in stride(from: 0, to: 4, by: 1)
        {
            let rand : Int = Int(arc4random() % 4)
            switch rand
            {
                case 0:
                    temp.insert(Color.black, at: index)
                    break;
                case 1:
                    temp.insert(Color.green, at: index)
                    break;
                case 2:
                    temp.insert(Color.red, at: index)
                    break;
                case 3:
                    temp.insert(Color.blue, at: index)
                    break;
                default:
                    break;
            }
        }
        finalGuess.guess = temp;
    }
    
    public func CheckPlayerGuess()
    {

    }
    
    public func UpdateCircleColor()
    {
         
    }
    
    public func AddGuess(colorGuessed: Color)
    {
        //First player guess, generate combination
        if(round == 0)
        {
            GenerateGuess()
        }
        playerGuess.guess.insert(colorGuessed, at: indexInGuess)
        colorRow.insert(colorGuessed, at: indexInGuess)
        indexInGuess += 1
        if(indexInGuess > 3)
        {
            CheckPlayerGuess()
            displayRowColor.insert(colorRow, at: round)
            indexInGuess = 0
            round += 1
        }
    }
    
    func FinishGame()
    {
        
    }
    
    
}
