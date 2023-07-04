//
//  OnboardingView.swift
//  DDR
//
//  Created by Desi Rorie on 6/27/23.
//

import SwiftUI

struct Onboarding: View {
    @State private var isAnimating:Bool = false
    @AppStorage("isOnboarding") private var isOnboarding:Bool?
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            ZStack{
                Circle()
                    .stroke(lineWidth: 5)
                    .fill(LinearGradient(colors: [.gray ,.black,.gray], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 400, height: 400)
                    
                
                    
                Text("C")
                    .foregroundColor(.white)
                    .font(.system(size: 200))
                    .opacity(isAnimating ? 1 : 0)
                    
                
                
                    
                Text("F")
                    .foregroundColor(.white)
                    .font(.system(size: 200))
                    .offset(x: 20, y: 110)
                    .opacity(isAnimating ? 1 : 0)
                
            }
            .onAppear{
                withAnimation(.easeOut(duration: 3)){
                    isAnimating = true
                }
                
                              DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                               isOnboarding = false
                              }

            
            }
            //: End of the VStack
        } //: End of the ZStack
    }
    
    
    struct OnboardingView_Previews: PreviewProvider {
        static var previews: some View {
            Onboarding()
        }
    }
}
