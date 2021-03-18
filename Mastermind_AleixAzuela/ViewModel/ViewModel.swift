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
    @Published var gameFinished: Bool = false
    
    private let defaultColors: [Color] = [.gray, .gray, .gray, .gray]
    public var finalGuess: [Color] = [.gray, .gray, .gray, .gray]
    var checkedMachine : [Bool] =  [false, false, false, false]
    var checkedPlayer : [Bool] =  [false, false, false, false]
    var outPut : [Color] =  [.white, .white, .white, .white]
    public var playerGuess: GuessModel = GuessModel()
    private var indexInGuess : Int = 0
    private var round : Int = 0
    
    
    internal func GenerateGuess()
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
    
    internal func CheckPlayerGuess()
    {
        var indexOutCome : Int = 0
        //Comparemm color i poosicio
        for index in stride(from: 0, to: 4, by: 1)
        {
            if(playerGuess.guess[index] == finalGuess[index])
            {
                checkedMachine[index] = true;
                checkedPlayer[index] = true;
                playerGuess.outCome[indexOutCome] = Color.red;
                indexOutCome += 1
                
            }
        }
        
        //Comparem nomes color
        for index in stride(from: 0, to: 4, by: 1)
        {
            for index2 in stride(from: 0, to: 4, by: 1)
            {
                if(playerGuess.guess[index] == finalGuess[index2])
                {
                    if(!checkedMachine[index2] && !checkedPlayer[index])//error
                    {
                        checkedMachine[index2] = true;
                        checkedPlayer[index] = true;
                        playerGuess.outCome[indexOutCome] = Color.yellow
                        indexOutCome += 1
                        break;
                    }
                }
            }
        }
        
        var temp : Bool = true;
        for index in stride(from: 0, to: 4, by: 1)
        {
            if(playerGuess.outCome[index] != Color.red)
            {
                temp = false;
            }
        }
        gameFinished = temp;
    }
    
    private func ResetChecked()
    {
        //Reset Checked and OutCome
        for index in stride(from: 0, to: 4, by: 1)
        {
            checkedMachine[index] = false;
            checkedPlayer[index] = false;
            playerGuess.outCome[index] = Color.white
        }
    }
    
    public func ResetPlayerGuess()
    {
        //Reset Player Guess
        indexInGuess = 0;
        playerGuess.guess = defaultColors;
        colorRow = defaultColors;
    }
    
    public func LockInPlayerGuess()
    {
        if(indexInGuess >= 3)
        {
            if(round == 0)
            {
                GenerateGuess()
            }
            CheckPlayerGuess()
            playerGuess.guessNumber = round + 1;
            displayRowColor.insert(playerGuess, at: round)
            ResetChecked();
            playerGuess.guess = defaultColors;
            colorRow = defaultColors;
            indexInGuess = 0
            round += 1
        }
    }
    
    public func AddGuess(colorGuessed: Color)
    {
        //First player guess, generate combination
        if(indexInGuess < 4)
        {
            playerGuess.guess[indexInGuess] = colorGuessed;
            colorRow[indexInGuess] =  colorGuessed;
            indexInGuess += 1
            
        }
    }
    
    func FinishGame()
    {
        //Reset Whole Game
        ResetPlayerGuess();
        ResetChecked();
        round = 0;
        gameFinished = false;
        displayRowColor.removeAll()
    }
    
    
}
