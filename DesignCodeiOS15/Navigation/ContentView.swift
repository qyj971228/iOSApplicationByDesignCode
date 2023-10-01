//
//  HomeView.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/9/19.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            switch selectedTab {
            case .home:
                HomeView()
            case .explore:
                AccountView()
            case .notifications:
                AccountView()
            case .library:
                AccountView()
            }
            CustomTabbar()
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 60)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // 预览配置 可以设置机型 屏幕大小 主题
//        HomeView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/) // 黑色预览
        ContentView()
    }
}
