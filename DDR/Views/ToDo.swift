//
//  ToDo.swift
//  DDR
//
//  Created by Desi Rorie on 6/27/23.
//

import SwiftUI

struct ToDo: View {
    @AppStorage("savedQuotes") private var savedQuotes:Data = Data()
    @State private var isAnimated: Bool = false
    @State private var showFact:Bool = false
    @State private var buttonisAnimating:Bool = true
    @State private var shouldRefresh = false
    @State var selectedTab:Int = 0
    
    
    var body: some View {
        
        
        return NavigationStack{
            ZStack{
                Color.black.ignoresSafeArea()
                VStack(alignment: .center){
       
              
                    
                    TabView( selection: $selectedTab) {
                        VStack{
                            HStack(spacing: 10){
                                GreetingView(greeting: "", name:"")
                                Spacer()
                                
                                NavigationLink {
                                    Onboarding()
                                } label: {
                                    SettingScreen()
                                }//END of greeting
                            }.padding()
                            
                            Spacer()
                            Image("catImage")
                                .resizable()
                                .scaledToFit()
                                .frame(width: isAnimated ? 0 : 300)
                                .onTapGesture {
                                    withAnimation(.easeOut(duration: 0.45)){
                                        isAnimated = true
                                        buttonisAnimating = false
                                    }
                                    showFact = true
                                }
                            Spacer()
                            
                            
                            VStack(){
                                if showFact {
                                    Spacer()
                                    if shouldRefresh {MemesView()} else {
                                        MemesView()
                                    }
                                    Spacer()
                                } else {
                                    
                                }
                            }.padding(20)
                            VStack{
                                Spacer()
                                if buttonisAnimating {
                                    Button {
                                        
                                    } label: {
                                        Text("Click The Cat For a Fact")
                                    }.disabled(buttonisAnimating)
                                        .padding()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.white, lineWidth: 2)
                                        )
                                } else{
                                    Button {
                                        shouldRefresh.toggle()
                                    } label: {
                                        Text("Another Fact?")
                                    }
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                        
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                                }
                                Spacer()
                            }
                            
                            Spacer()
                        }
                            .tabItem {
                                Image(systemName: "house.fill")
                                Text("Home")
                           }
                            .tag(0)

                 
                        Text("Likes")
                            LikedView()
                            .tabItem {
                                Image(systemName: "heart")
                                Text("Liked")
                            }
                            .tag(1)
             
                    }.accentColor(.purple)
                    .preferredColorScheme(.dark)
                    
                }// End of the vstack
                .foregroundColor(.white)
                
            }
        }
            
          
            
            // End of NavStack
    }
  
}


struct ToDo_Previews: PreviewProvider {
    static var previews: some View {
        ToDo()
    }
}






//                VStack(){
//                    if showFact {
//                        Spacer()
//                        MemesView()
//                        Spacer()
//                    } else {
//
//                    }
//                }.padding(20)
//
//

struct HomeView: View {
    var body: some View {
        ZStack{
            Color.black
            Text("HomeTab").foregroundColor(.white)
            
        }
    }
}
