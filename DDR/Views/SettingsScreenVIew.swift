//
//  SettingsScreenVIew.swift
//  DDR
//
//  Created by Desi Rorie on 7/8/23.
//

import SwiftUI

struct SettingsScreenVIew: View {
    let defaultUrl = URL(string: "https://www.google.com")!
    let youtubeUrl = URL(string: "https://www.youtube.com/c/swiftfulthinking")!
    
    
    @State private var toggleIsOn:Bool = false
    
    @Environment(\.presentationMode) var isPresented
    var body: some View {
        NavigationStack {
            Toggle(isOn: $toggleIsOn) {
                Text("Change")
            }
            .toggleStyle(SwitchToggleStyle(tint: .red))
            .padding()
            List{
             swiftfulThinkingSection
                swiftfulThinkingSectionTwo
            
            }
            .font(.headline)
            .listStyle(.grouped)
                .navigationTitle(Text("Settings"))
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            isPresented.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "xmark").foregroundColor(.white
                            )
                        }
                        
                        
                    }
                }
        }
    }
}

struct SettingsScreenVIew_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreenVIew()
    }
}

extension SettingsScreenVIew {
    private var swiftfulThinkingSection: some View{
        Section {
            VStack(alignment: .leading) {
                Image(systemName: "gear")
                Text("This is the first settings section made by DezCodes").font(.callout)
                    .fontWeight(.medium)
                
            }.padding()
            Link("Subscribe to dez 🎉", destination: youtubeUrl).foregroundColor(.blue)
            
        } header: {
            Text("Header")
        }
    }
    private var swiftfulThinkingSectionTwo: some View{
        Section {
            VStack(alignment: .leading) {
                Image(systemName: "tree")
                Text("This is the second settings second made by DezCodes").font(.callout)
                    .fontWeight(.medium)
                
            }.padding()
            Link("Subscribe to dez 🎉", destination: defaultUrl).foregroundColor(.blue)
            
        } header: {
            Text("Header")
        }
    }
}
