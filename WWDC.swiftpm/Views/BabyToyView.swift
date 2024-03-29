//
//  SwiftUIView.swift
//  
//
//  Created by temp on 09/01/24.
//

import SwiftUI

struct BabyToyView: View {
    @StateObject private var viewModel = ToyViewModel()
    
    
    let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { state in
                viewModel.update(dragPosition: state.location)
            }
            .onEnded { state in
                viewModel.update(dragPosition: state.location)
                withAnimation {
                    viewModel.confirmDrop()
                }
            }
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LazyVGrid(columns: gridItems, spacing: 100) {
                    ForEach(viewModel.toyContainers, id: \.id) { toy in
                        ToyContainer(
                            toy: toy,
                            viewModel: viewModel
                        )
                    }
                }
                if let currentToy = viewModel.currentToy {
                    Draggable(
                        toy: currentToy,
                        position: viewModel.currentPosition,
                        gesture: drag
                    )
                    .opacity(viewModel.draggableToyOpacity)
                }
            }
            .onAppear {
                viewModel.setupGame()
            }
            .alert(
                Text("Congratulations, You Won! "),
                isPresented: $viewModel.isGameOver,
                actions: {
                    Button("OK") {
                        withAnimation {
                            viewModel.generateNewGame()
                        }
                    }
                },
                message: {
                    Text("Number of attemps: \(viewModel.attempts)")
                }
            )
        }
    }
}

struct BabyToyiew_Previews: PreviewProvider {
    static var previews: some View {
        BabyToyView()
    }
}
