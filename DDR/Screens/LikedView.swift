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
//                Text("Your Liked Facts")
//                    .foregroundColor(.white)
//                    .font(.largeTitle)
//                Spacer().frame(height: 10)
                NavigationView{
                    List{
                        Section(header: Text("Liked Facts")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .center)

                        ) {
                            ForEach(likedQuotes,id: \.self) { quote in
                                HStack{
                                    HStack {
                                        VStack {
                                            Text(quote.fact)
                                        }
                                        Spacer()
                                        
                                        
                                    }
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Button {
                                                print("You Clicked Me")
                                                //                                    deleteQuote(quote)
                                            } label: {
                                                Image(systemName: "trash")
                                                    .foregroundColor(.red)
                                                    .offset(x: 15)
                                                    .onTapGesture {
                                                        deleteQuote(quote)
                                                    }
                                            }
                                            
                                        }
                                        
                                    }
                                    
                                }
                                
                            }.onDelete{
                                deleteQuotes(at: $0)
                            }
                            .onMove { IndexSet, Int in
                                likedQuotes.move(fromOffsets: IndexSet, toOffset: Int)
                            }
                            
                            
                            
                        }
                    }.navigationBarItems(leading: EditButton().bold().font(.system(size: 25)).foregroundColor(.purple))
                        .preferredColorScheme(.dark)
                }.navigationBarItems(leading: EditButton())
                //                List(likedQuotes,id: \.self) { quote in
                //                    HStack{
                //                        HStack {
                //                            VStack {
                //                                Text(quote.fact)
                //                            }
                //                            Spacer()
                //
                //
                //                        }
                //                        VStack{
                //                            Spacer()
                //                            HStack{
                //                                Button {
                //                                    print("You Clicked Me")
                ////                                    deleteQuote(quote)
                //                                } label: {
                //                                    Image(systemName: "trash")
                //                                        .foregroundColor(.red)
                //                                        .offset(x: 15)
                //                                        .onTapGesture {
                //                                            deleteQuote(quote)
                //                                        }
                //                                }
                //
                //                            }
                //
                //                        }
                //
                //                    }
                //
                //                }
                //                .preferredColorScheme(.dark)
                //                Spacer()
            }
            
        }
        .onAppear{
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
    
    func deleteQuote(_ quote: Quote) {
        likedQuotes.removeAll { $0 == quote }
        saveLikedQuotes()
        print(likedQuotes)
    }
    
    func deleteQuotes(at offsets: IndexSet) {
        likedQuotes.remove(atOffsets: offsets)
        saveLikedQuotes()
    }
    
    func saveLikedQuotes() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(likedQuotes)
            savedQuotes = data
        } catch {
            print("Failed to encode liked quotes: \(error)")
        }
    }
}
//
//    func loadLikedQuotes() {
//        do {
//            let decoder = JSONDecoder()
//            let quotes = try decoder.decode([Quote].self, from: savedQuotes)
//            likedQuotes = quotes
//        } catch {
//            print("Failed to decode liked quotes: \(error)")
//        }
//    }
//}

struct LikedView_Previews: PreviewProvider {
    static var previews: some View {
        LikedView()
    }
}
