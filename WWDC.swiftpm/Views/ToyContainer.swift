//
//  SwiftUIView.swift
//  
//
//  Created by temp on 10/01/24.
//

import SwiftUI

struct ToyContainer: View {
    let toy: Toy
    @ObservedObject var viewModel: ToyViewModel
    private let regularSize : CGFloat = 100
    private let highlightedSize: CGFloat = 130
    
    var body: some View {
        ZStack {
            Circle()
                .fill(toy.color)
                .frame(width: regularSize, height: regularSize)
                .overlay {
                    GeometryReader { proxy -> Color in
                        viewModel.update(
                            frame: proxy.frame(in: .global),
                            for: toy.id)
                        
                        return Color.clear
                    }
                }
            if viewModel.isHiglighted(id: toy.id) {
                Circle()
                    .fill(toy.color)
                    .opacity(0.5)
                    .frame(width: highlightedSize, height: highlightedSize)
            }
        }
        .frame(width: highlightedSize, height: highlightedSize) 
    }
}
#Preview {
    ToyContainer(toy: Toy.all.first!, viewModel: ToyViewModel())
}
