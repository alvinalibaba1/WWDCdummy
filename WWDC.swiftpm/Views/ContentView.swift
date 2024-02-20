//
//  ContentView.swift
//  WWDC
//
//  Created by temp on 17/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAnimatingButtonPlay = false
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    //VIEW
                    titleView
                    
                }
            }
            .background(
                Image("background2")
                    .resizable()
                    .scaledToFill()
            )
            .edgesIgnoringSafeArea(.all)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    
    var titleView: some View {
        VStack {
            Image("title1")
                .resizable()
                .scaledToFit()
                .frame(width: 700)
                .padding(.bottom)
                .overlay(
                    HStack{
                        Image("girl1")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 200)
                            .position(x: 80, y:400)
                        Spacer()
                        
                    
                        Image("boy1")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 200)
                            .position(x: 260, y:400)
                    }
                        .offset(y:300)
                )
            NavigationLink(destination: IntroductionView()) {
                Text("PLAY".uppercased())
                    .font(.system(size: 40))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.pink.opacity(0.2))
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Color.white.opacity(0.5)
                            .cornerRadius(10)
                            .shadow(
                                color: Color.white.opacity(1), radius: 500)
                    )
                    .scaleEffect(isAnimatingButtonPlay ? 1.2 : 1.0)
                    .onAppear {
                        withAnimation(Animation
                            .easeInOut(duration:
                                        1.5).repeatForever()) {
                            self.isAnimatingButtonPlay.toggle()
                        }
                    }
            }.padding(20)
                .padding(.bottom, 0)
        }.padding(.bottom)
            .padding(.top,50)
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.landscapeLeft)
    }
}
