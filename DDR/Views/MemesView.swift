
import SwiftUI


struct Quote: Codable,Hashable {
    
    let fact: String
    let length: Int
}


struct MemesView: View {
    @AppStorage("savedQuotes") private var savedQuotes:Data = Data()
    @State private var quotes: Quote?
    @State private var postWasLiked: Bool = false
    @State private var likedQuotes:[Quote] = []
    @State private var refreshButtonTapped = false

    
    
    var body: some View {
        VStack {
            ZStack {
                VStack(){
                    
                    VStack(alignment: .leading )
                    {
                        Text(quotes?.fact ?? "cats have 4 legs" ) .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                    }.padding()
                    HStack{
                        Text("Fact \(quotes?.length ?? 0)")
                        Spacer()
                        
                        Image(systemName:postWasLiked ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                            .onTapGesture {
//                                postWasLiked = !postWasLiked
                                
                                likedQuotes.append(quotes ?? Quote(fact: "", length: 0))
                                
                            saveLikedQuotes()
                                print(likedQuotes)
                                fetchData()
                                
                                
//                                postWasLiked = !postWasLiked
                            
                            }
                    }.padding()

                
                    
                }.frame(height: 250)
                    .background(Rectangle()
                        .fill(Color("CardColor"))
                        .cornerRadius(5)
                                
                                
                    )
                    .frame(width: 400)
            }.shadow(color: .gray, radius: 5, x: 0, y: 0)
            .onAppear{
                loadLikedQuotes()
                postWasLiked = false
                fetchData()
        }
            Spacer()
            VStack{
                Button {
                    fetchData()
                } label: {
                    Text("Another Fact?")
                }.padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white, lineWidth: 2))
            }.foregroundColor(.white)
            Spacer()
        }
        
    }
//
//    func fetchData() async {
//        guard let url = URL(string: "https://catfact.ninja/fact") else{
//            print("BAD uRL")
//            return
//        }
//        do{
//            let (data, response) = try await URLSession.shared.data(from: url)
//
//            if let decodedResponse = try? JSONDecoder().decode(Quote.self, from: data){
//                quotes = decodedResponse
//                print(response)
//            }
//        }
//        catch{
//            print(":(")
//
//        }
//    }
    func loadLikedQuotes() {
        do {
            let decoder = JSONDecoder()
            let quotes = try decoder.decode([Quote].self, from: savedQuotes)
            likedQuotes = quotes
        } catch {
            print("Failed to decode liked quotes: \(error)")
        }
    }
    func fetchData() {
        guard let url = URL(string: "https://catfact.ninja/fact") else {
            print("BAD URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(Quote.self, from: data)
                    DispatchQueue.main.async {
                        quotes = decodedResponse
                    }
                } catch {
                    print("Error decoding response: \(error)")
                }
            }
        }.resume()
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



struct MemesView_Previews: PreviewProvider {
    static var previews: some View {
        MemesView().preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}


