//
//  MainMenu.swift
//  SmartKaryeraPRO
//
//  Created by Zamin Orucov on 8/26/25.
//

import SwiftUI

struct MainMenu: View {
    var body: some View {
        TabView {
            MainScreen()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            CareerChatView()
                .tabItem {
                    Label("Karyera Chat", systemImage: "message.fill")
                }
            
            CareerPortalView()
                .tabItem {
                    Label("Karyera Portalı", systemImage: "globe")
                }
            
            MoreView()
                .tabItem {
                    Label("Daha çox", systemImage: "ellipsis.circle")
                }
        }
        .accentColor(.blue) // 🔹 Aktiv tab rəngi
    }
}
#Preview {
    MainMenu()
}
