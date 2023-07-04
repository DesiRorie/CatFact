//
//  GreetingView.swift
//  DDR
//
//  Created by Desi Rorie on 6/27/23.
//

import SwiftUI

struct GreetingView: View {
    
    @AppStorage("firstName") var firstName: String?
    
    @State var greeting:String
    
   @State var name:String
    
    func checkTime(){
        let calendar = Calendar.current
        let hour  = calendar.component(.hour, from: Date())
        
        if (hour < 12){
            greeting = "Good Morning"
        }
        else if (hour > 12 && hour < 17 ){
            greeting = "Good Afternooon"
        }
        else
        { greeting = "Good Evening"}
        
        
        
    }
    var body: some View {
        HStack{
            if let firstName = firstName {
                           Text("\(greeting), \(firstName)")
                       } else {
                           Text(greeting)
                       }
        }.frame(width: 200, height: 100)
            .foregroundColor(.white)
//            .font(.system(.largeTitle,weight: .bold))
            .font(.system(size: 20, weight: .bold))
            .onAppear{
                checkTime()
                
            }
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView(greeting: "Welcome", name: "")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
