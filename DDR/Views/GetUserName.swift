//
//  GetUserName.swift
//  DDR
//
//  Created by Desi Rorie on 6/30/23.
//

import SwiftUI

struct GetUserName: View {
    @AppStorage("firstName") var firstName: String?
    @State var userFirstName:String
    @AppStorage("nilUserName") private var nilUserName:Bool?
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                TextField("Welcome, what is your name?", text: $userFirstName)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Button("Submit") {
                    firstName = userFirstName
                    nilUserName = false
                    
                }.foregroundColor(.white)
            }
        }
    }
}

struct GetUserName_Previews: PreviewProvider {
    static var previews: some View {
        GetUserName(userFirstName: "")
    }
}
