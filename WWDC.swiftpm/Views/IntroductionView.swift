//
//  IntroductionView.swift
//  WWDC
//
//  Created by temp on 24/01/24.
//

import SwiftUI

struct IntroductionView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var isIntroductionOverlay: Bool = true
    @State var isBackgroundStory1: Bool = true
    @State var isBackgroundStory2: Bool = false
    @State var isBackgroundStory3: Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack{
                VStack {
                    Spacer()
                    
                    //START BUTTON
                    NavigationLink(destination: Level1View()) {
                            Text("LEVEL 1")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(Color.purple)
                                .frame(width: 300, height: 70)
                                .background(Color.white)
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))
                            .padding(4)}
                    
                    //CHAPTERS BUTTON
                    NavigationLink(destination: Level2View()) {
                            Text("LEVEL 2")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.purple
                                )
                                .frame(width: 300, height: 70)
                                .background(Color.white).opacity(0.9)
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))
                            .padding(4)}
                    
                    //CREDITS BUTTON
                    NavigationLink(destination: Level3View()) {
                        Text("LEVEL 3")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.purple)
                            .frame(width: 300, height: 70)
                            .background(Color.white).opacity(0.9)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))
                            .padding(4)
                    }
                    
//                    .onAppear{
//                        music(music: "musicWWDC")}
                    
                    Spacer()
                    
                } .padding(56)
                
                if isIntroductionOverlay {
                    introductionOverlay
                    if isBackgroundStory1{
                        backgroundStory1
                    } else if isBackgroundStory2{
                        backgroundStory2
                    }
                }
                buttonAction
            }
            .background(
                Image("background3")
                    .resizable()
                    .scaledToFill()
                )
            .edgesIgnoringSafeArea(.all)
            
        }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        
        
    }
    
    
    var introductionOverlay: some View {
        Rectangle()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.ultraThinMaterial)
            .foregroundColor(Color.black.opacity(0.2))
            .foregroundStyle(.ultraThinMaterial)
            .edgesIgnoringSafeArea(.all)
    }
    
    var buttonAction: some View {
        GeometryReader{ geometry in
            HStack {
                if !isBackgroundStory1 && !isBackgroundStory2 && !isBackgroundStory3 {
                    Button(action: {
                        isIntroductionOverlay.toggle()
                        isBackgroundStory1.toggle()
                    }, label: {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 75, height: 75)
                            .shadow(radius: 10)
                            .overlay(
                                Image(systemName: "info.circle.fill")
                                    .font(.system(size: 50))
                                    .foregroundColor(Color.yellow))
                    }).padding(.bottom, 50)
                        .padding(.horizontal)
                }
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.yellow)
                        .frame(width: 75, height: 75)
                        .shadow(radius: 10)
                        .overlay(
                            Image(systemName: "house.fill")
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        )
                }).padding(.bottom, 50)
            }.position(x: geometry.size.width/2, y: geometry.size.height/1.03)
        }
    }
    
    var backgroundStory1: some View {
        VStack {
            Image("backgroundStory1")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 650)
            Text(information.infoIntroduction[0])
                .font(.title)
                .fontWeight(.semibold)
                .baselineOffset(4)
                .kerning(1.5)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .padding()
                .padding(.bottom, 30)
            HStack {
                Spacer()
                HStack {
                    Button(action:  {
                        isBackgroundStory1.toggle()
                        isBackgroundStory2.toggle()
                    }, label: {
                        Image(systemName: "arrow.right")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .bold()
                            .padding(.horizontal)
                            .padding()
                            .padding(.vertical)
                    })
                    .background(Color.yellow)
                }
                .cornerRadius(25)
            }
            .padding(.horizontal)
            .padding(.bottom)
            .overlay(
                HStack {
                    Image("boy2")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        Image("girl")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                        .offset(y: 20)
                }
                
                ,alignment: .bottomLeading
            )
        }
        .padding()
        .background(
            Color.purple.opacity(0.3)
        )
        .cornerRadius(25)
        .padding(16)
        .padding(.horizontal, 60)
        .transition(AnyTransition.scale.animation(.easeInOut))
    }
    var backgroundStory2: some View {
        VStack {
            HStack {
                Image("backgroundStory2")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 650)
            }
            
            Text(information.infoIntroduction[1])
                .font(.title)
                .fontWeight(.semibold)
                .baselineOffset(4)
                .kerning(1.5)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .padding()
                .padding(.bottom, 30)
            HStack {
                Spacer()
                HStack{
                    Button(action: {
                        isBackgroundStory1.toggle()
                        isBackgroundStory2.toggle()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .font(.title)
                            .foregroundColor(Color.white.opacity(0.4))
                            .padding(20)
                            .background(Color.yellow.opacity(0.3))
                            .cornerRadius(25)
                    })
                    Button(action: {
                        isBackgroundStory2.toggle()
                        isIntroductionOverlay.toggle()
                    }, label: {
                        Image(systemName: "arrow.right")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .bold()
                            .padding(.horizontal)
                            .padding()
                            .padding(.vertical)
                            .background(Color.yellow)
                            .cornerRadius(25)
                    })
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            .overlay(
                HStack{
                    Image("boy2")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                    Image("girl2")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                }
                ,alignment: .bottomLeading
            )
        }
        .padding(.top, 50)
        .padding()
        .background(Color.purple.opacity(0.3))
        .cornerRadius(25)
        .padding(16)
        .padding(.horizontal, 40)
        .transition(AnyTransition.scale.animation(.easeInOut))
    }
            
}
    

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}
