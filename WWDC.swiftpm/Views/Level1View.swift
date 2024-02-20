//
//  Level1View.swift
//  WWDC
//
//  Created by temp on 15/02/24.
//

import SwiftUI

struct Level1View: View {
    @State private var correctAnswer = 0
    @State private var choiceArray : [Int] = [0,1,2,3]
    @State private var firstNumber = 0
    @State private var secondNumber = 0
    @State private var difficulty = 100
    @State private var score = 0
    var body: some View {
        VStack {
            Text("\(firstNumber) + \(secondNumber)")
                .font(.largeTitle)
                .bold()
            
            HStack {
                ForEach(0..<2) { index in
                    Button {
                        answerIsCorrect(answer: choiceArray[index])
                        generateAnswers()
                    } label: {
                        AnswerButton(number: choiceArray[index])
                    }
                }
            }
            
            HStack {
                ForEach(2..<4) { index in
                    Button {
                        answerIsCorrect(answer: choiceArray[index])
                        generateAnswers()
                    } label: {
                        AnswerButton(number: choiceArray[index])
                    }
                }
            }
            
            Text("Score \(score)")
                .font(.largeTitle)
                .bold()
            
        }.onAppear(perform: generateAnswers)
    }
    
    func answerIsCorrect(answer: Int) {
        if answer == correctAnswer {
            score += 1
        } else {
            score -= 1
        }
    }
    
    
    func generateAnswers() {
        
        if score < 10 {
            difficulty = 10
        } else if score < 25 {
            difficulty = 100
        } else {
            difficulty = 1000
        }
        
        firstNumber = Int.random(in: 0...(difficulty/2))
        secondNumber = Int.random(in: 0...(difficulty/2))
        correctAnswer = firstNumber + secondNumber
        var answerList = [Int]()
        
        
        for _ in 0...2 {
            answerList.append(Int.random(in: 0...difficulty))
        }
        
        answerList.append(correctAnswer)
        
        choiceArray = answerList.shuffled()
    }
}

#Preview {
    Level1View()
}
