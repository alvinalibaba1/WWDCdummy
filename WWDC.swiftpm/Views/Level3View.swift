//
//  Level1.swift
//  WWDC
//
//  Created by temp on 25/01/24.
//

import SwiftUI

struct Level3View: View {
    
    @StateObject private var viewModel = TictactoeViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("TIC TAC TOE")
                LazyVGrid(columns: viewModel.columns , spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack {
                            GameSquareView(proxy: geometry)
                            
                            PlayerIndicator(bot: viewModel.moves[i]?.indicator ?? "minus")
                            
                        }
                        .onTapGesture {
                            viewModel.prosesPlayerMove(for: i)
                        }
                    }
                }
                Spacer()
            }
            .background(Color.white)
            .disabled(viewModel.isGameBoardDisabled)
            .padding()
            .alert(item: $viewModel.alertItem, content: { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: .default(alertItem.buttonField, action: { viewModel.resetGame() }))
            })
        }
    }
}
    enum Player {
        case human, computer
    }
    
    struct Move {
        let player: Player
        let boardIndex: Int
        
        var indicator: String {
            return player == .human ? "xmark" : "circle"
        }
    }
    

struct GameSquareView: View {
    
    var proxy: GeometryProxy
    
    var body: some View {
        Circle()
            .foregroundColor(.blue).opacity(0.5)
            .frame(width: proxy.size.width/3 - 200,
                   height: proxy.size.width/3 - 200)
    }
}

struct PlayerIndicator: View {
    
    
    var bot: String
    
    var body: some View {
        Image(systemName: bot)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
    }
}

struct Level3View_Previews: PreviewProvider {
    static var previews: some View {
        Level3View()
    }
}
