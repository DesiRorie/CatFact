//
//  SwiftUIView.swift
//  DDR
//
//  Created by Desi Rorie on 7/7/23.
//

import SwiftUI

struct SettingsMenuView: View {
    var body: some View {
        VStack(spacing: 5){
            RoundedRectangle(cornerRadius: 4).frame(width: 20, height: 2).foregroundColor(.white)
            RoundedRectangle(cornerRadius: 4).frame(width: 20, height: 2).foregroundColor(.white)
            RoundedRectangle(cornerRadius: 4).frame(width: 20, height: 2).foregroundColor(.white)
        }
    }
}

struct SettingsMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsMenuView().previewLayout(.sizeThatFits)
    }
}

