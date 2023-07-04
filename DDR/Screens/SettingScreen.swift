//
//  SettingScreen.swift
//  DDR
//
//  Created by Desi Rorie on 6/27/23.
//

import SwiftUI

struct SettingScreen: View {
    var body: some View {
        
        HStack{
            ZStack{
                Circle().fill(.white)
                    .frame(width: 50)
               
                Image(systemName: "gear")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.black)
                    .frame(width: 25, height: 25)
            }
        }
    }
}

struct SettingScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingScreen()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
