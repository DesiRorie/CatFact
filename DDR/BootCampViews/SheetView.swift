//
//  SheetView.swift
//  DDR
//
//  Created by Desi Rorie on 7/1/23.
//

import SwiftUI

struct SheetView: View {
    @State var showSheet:Bool = false
    var body: some View {
        ZStack{
            Color.green
                .edgesIgnoringSafeArea(.all)
            Button {
                showSheet.toggle()
            } label: {
                Text("Button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding(20)
                    .background(Color.white.cornerRadius(10))
                
            }
//            .sheet(isPresented: $showSheet) {
//                SecondView()
//            }
            .fullScreenCover(isPresented: $showSheet) {
                SecondView()
            }
            
            
        }
    }
}
struct SecondView: View{
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.red
                .edgesIgnoringSafeArea(.all)
          
            VStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding(20)
                        
                    
                }
            }
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}


//struct SecondScreen: PreviewProvider {
//    static var previews: some View {
//        SecondView()
//    }
//}
