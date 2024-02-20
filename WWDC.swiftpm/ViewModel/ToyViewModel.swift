//
//  File.swift
//  
//
//  Created by temp on 10/01/24.
//

import SwiftUI

class ToyViewModel: ObservableObject {
    //MARK: - Gesture Properties
    @Published var currentToy: Toy?
    @Published var currentPosition = initialPosition
    @Published var highlightedId: Int?
    @Published var draggableToyOpacity: CGFloat = 1.0
    @Published var isGameOver = false
    private(set) var attempts = 0
    
    //MARK: - CORDINATES
    private static let initialPosition = CGPoint(
        x: UIScreen.main.bounds.midX,
        y: UIScreen.main.bounds.maxY - 200
    )
    private var frames:  [Int: CGRect] = [:]
    
    //MARK: - Objects in the screen
    private var toys = Array(Toy.all.shuffled().prefix(upTo: 5))
    var toyContainers = Toy.all.shuffled()
    
    
    //MARK: - Game lifecycle
    func setupGame() {
        currentToy = toys.popLast()
    }

    func nextRound() {
        currentToy = toys.popLast()
        
        if currentToy == nil {
            gameOver()
        } else {
            prepareObject()
        }
    }
    
    func gameOver() {
        isGameOver = true
    }
    
    func prepareObject() {
        withAnimation {
            toyContainers.shuffle()
        }
        withAnimation(.none) {
            resetPosition()
            withAnimation {
                draggableToyOpacity = 1.0
            }
        }
    }
    
    func generateNewGame() {
        toys = Array(Toy.all.shuffled().prefix(upTo: 5))
        attempts = 0
        nextRound()
    }
    
    //MARK: - Updates in the screen
    func update(frame: CGRect, for id: Int) {
        frames[id] = frame
    }
    
    
    func update(dragPosition: CGPoint) {
        currentPosition = dragPosition
        for(id, frame) in frames where frame.contains(dragPosition) {
            highlightedId = id
            return
        }
        
        highlightedId = nil
    }
    
    func confirmDrop() {
        defer { highlightedId = nil }
        
        guard let highlightedId = highlightedId else {
            resetPosition()
            return
        }
        
        if highlightedId == currentToy?.id {
            guard let frame = frames[highlightedId] else {
                return
            }
            
            currentPosition = CGPoint(x: frame.midX, y: frame.midY)
            draggableToyOpacity = 0
            nextRound()
        } else {
            resetPosition()
        }
        
        attempts += 1
        
    }
    
    func resetPosition() {
        currentPosition = ToyViewModel.initialPosition
    }
    
    func isHiglighted(id: Int) -> Bool {
        highlightedId == id
    }
}
