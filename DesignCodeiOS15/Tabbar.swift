//
//  Tabbar.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/9/26.
//

import SwiftUI

struct Tabbar: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Learn Now")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
        }
    }
}

#Preview {
    Tabbar()
}
