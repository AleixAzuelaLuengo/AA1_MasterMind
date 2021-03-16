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
    @Published var displayRowColor: [GuessModel] = Array<GuessModel>()

    
    @Published var colorRow: [Color] = [.gray, .gray, .gray, .gray]
    
    private let defaultColors: [Color] = [.gray, .gray, .gray, .gray]
    
    
    public var finalGuess: [Color] = [.gray, .gray, .gray, .gray]
    public var playerGuess: GuessModel = GuessModel()
    private var indexInGuess : Int = 0
    private var round : Int = 0
    private var guessFinished: Bool = false
    
    
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
        finalGuess = temp;
    }
    
    public func CheckPlayerGuess()
    {
        
    }
    
    public func ResetPlayerGuess()
    {
        indexInGuess = 0;
        playerGuess.guess = defaultColors;
        colorRow = defaultColors;
    }
    
    public func LockInPlayerGuess()
    {
        if(indexInGuess >= 3)
        {
            CheckPlayerGuess()
            playerGuess.guessNumber = round + 1;
            displayRowColor.insert(playerGuess, at: round)
            playerGuess.guess = defaultColors;
            colorRow = defaultColors;
            indexInGuess = 0
            round += 1
        }
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
    }
    
    func FinishGame()
    {
        
    }
    
    
}
