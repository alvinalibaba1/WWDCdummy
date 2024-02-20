//
//  SwiftUIView.swift
//  
//
//  Created by temp on 09/01/24.
//

import SwiftUI

struct Draggable<DraggableMove: Gesture>: View {
    let toy: Toy
    private let size: CGFloat = 100
    let position: CGPoint
    let gesture: DraggableMove
    
    var body: some View {
        Circle()
            .fill(toy.color)
            .frame(width: size, height: size)
            .position(position)
            .gesture(gesture)
    }
}

struct Draggable_Previews: PreviewProvider {
    static var previews: some View {
        Draggable(
            toy: Toy.all.first!,
            position: CGPoint(x: 100, y: 100),
            gesture: DragGesture())
    }
}
