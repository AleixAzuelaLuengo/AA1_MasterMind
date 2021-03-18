//
//  FinishedStack.swift
//  Mastermind_AleixAzuela
//
//  Created by Alumne on 17/3/21.
//

import Foundation
import SwiftUI

struct FinishedStack: View
{
    let round : Int
    let action: () -> Void
    
    var body: some View
    {
        VStack(alignment: .center, spacing: 10)
        {
            if(round < 12)
            {
                Text(String("You won!")).padding()
            }
            else
            {
                Text(String("You Lost :(")).padding()
            }
            Button("Reset", action: { action() })
                .frame(width: 100, height: 50, alignment: .center)
                .background(Color.white)
                .cornerRadius(30)
        }
    }
}
