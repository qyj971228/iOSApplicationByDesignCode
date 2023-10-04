//
//  HomeView.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/9/19.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @AppStorage("showModal") var showModal = false
    @EnvironmentObject var model: Model
    
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
                .offset(y: model.showDetail ? 250 : 0)
//            ZStack {
//                Color.clear.background(.regularMaterial)
//                    .ignoresSafeArea()
//                SignUpView()
//                
//                Button {
//                    withAnimation(.opencard) {
//                        showModal = false
//                    }
//                } label: {
//                    Image(systemName: "xmark")
//                        .font(.body.weight(.bold))
//                        .foregroundColor(.secondary)
//                        .padding(8)
//                        .background(.ultraThinMaterial, in: Circle())
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
//                .padding(20)
//            }
//            .zIndex(showModal ? 1 : -1)
        }
        .sheet(isPresented: $showModal, content: {
            ZStack() {
                SignUpView()
                Button {
                    showModal = false
                } label :{
                    Image(systemName: "xmark")
                        .font(.body.weight(.bold))
                        .foregroundColor(.secondary)
                        .padding(8)
                        .background(.ultraThinMaterial, in:Circle())
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding(20)
            }
            
        })
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
            .environmentObject(Model())
    }
}
