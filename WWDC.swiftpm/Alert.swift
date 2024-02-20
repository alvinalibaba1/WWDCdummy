//
//  Alert.swift
//  WWDC
//
//  Created by temp on 02/02/24.
//

import SwiftUI


struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonField: Text
}

struct AlertContext {
    static let humanWin = AlertItem(title: Text("You Win"), message: Text("You are so smart, You beat your own AI"), buttonField: Text("Hell yeah"))
    
    static let aiWin = AlertItem(title: Text("You Lost"), message: Text("You Progammed a super ai"), buttonField: Text("Rematch"))
                             
    static let draw = AlertItem(title: Text("Draw"), message: Text("what a battle we have here "), buttonField: Text("Try Again"))
}
