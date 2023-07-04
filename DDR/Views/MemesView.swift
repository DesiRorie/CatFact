
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
    
    var body: some View {
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
                            postWasLiked = !postWasLiked
                            likedQuotes.append(quotes ?? Quote(fact: "", length: 0))
                        saveLikedQuotes()
                            
                        
                    }
                }.padding()

            
                
            }.frame(height: 250)
                .background(Rectangle()
                    .fill(Color("CardColor"))
                    .cornerRadius(5)
                            
                            
                )
                .frame(width: 400)
                .task {
                    await fetchData()
                    
                }
            
            
        }.onAppear{
            postWasLiked = false
        }
    }
    
    func fetchData() async {
        guard let url = URL(string: "https://catfact.ninja/fact") else{
            print("BAD uRL")
            return
        }
        do{
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Quote.self, from: data){
                quotes = decodedResponse
                print(response)
            }
        }
        catch{
            print(":(")
            
        }
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


