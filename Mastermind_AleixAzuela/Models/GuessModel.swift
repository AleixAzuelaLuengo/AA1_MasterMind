//
//  GuessModel.swift
//  Mastermind_AleixAzuela
//
//  Created by Alumne on 12/3/21.
//

import SwiftUI

struct GuessModel : Hashable
{
    var guessNumber : Int
    var guess : Array<Color>
    var outCome: Array<Color>
    internal init()
    {
        guessNumber = 0;
        outCome = Array<Color>(arrayLiteral: Color.white,Color.white,Color.white,Color.white)
        guess = Array<Color>(arrayLiteral: Color.gray,Color.gray,Color.gray,Color.gray)
    }
}

