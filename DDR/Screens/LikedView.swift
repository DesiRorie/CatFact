//
//  LikedView.swift
//  DDR
//
//  Created by Desi Rorie on 7/2/23.
//

import SwiftUI

struct LikedView: View {
    @AppStorage("savedQuotes") private var savedQuotes:Data = Data()
    @State private var likedQuotes: [Quote] = []
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Your Liked Facts")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Spacer().frame(height: 10)
                
                List(likedQuotes,id: \.self) { quote in
                    Text(quote.fact)
                    
                }.preferredColorScheme(.dark)
                Spacer()
            }
            
        }.onAppear{
            loadLikedQuotes()
        }
    }
    func loadLikedQuotes() {
        do {
            let decoder = JSONDecoder()
            let quotes = try decoder.decode([Quote].self, from: savedQuotes)
            likedQuotes = quotes
        } catch {
            print("Failed to decode liked quotes: \(error)")
        }
    }
}

struct LikedView_Previews: PreviewProvider {
    static var previews: some View {
        LikedView()
    }
}
