//
//  DDRApp.swift
//  DDR
//
//  Created by Desi Rorie on 6/22/23.
//

import SwiftUI

@main
struct DDRApp: App {
    @AppStorage("isOnboarding") private var isOnboarding:Bool = true
    @AppStorage("nilUserName") private var nilUserName:Bool = true
    @AppStorage("firstName") var firstName: String?
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding{
                Onboarding()
                
            }
            else {
                if let firstName = firstName, !firstName.isEmpty {
                    ContentView()
                } else {
                    GetUserName(userFirstName: firstName ?? "")
                }
            }
        }
    }
}
