//
//  NavigationBar.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/10/1.
//

import SwiftUI

struct NavigationBar: View {
    var title = ""
    @Binding var hasScrolled: Bool // 响应数据绑定，传入时使用$做前缀
    @State var showSearch = false
    @State var showAccount = false
    @AppStorage("showModal") var showModal = false
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 1 : 0)
            Text(title)
                .animatableFont(size: hasScrolled ? 22 : 34, weight: .bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset(y: -10)
            HStack {
                searchButton
                avatarButton
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 20)
            .padding(.top, 20)
            .offset(y: -10)
        }
        .frame(height: hasScrolled ? 44 : 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    var searchButton: some View {
        Button {
            showSearch.toggle()
        } label: {
            Image(systemName: "magnifyingglass")
                .font(.body.weight(.bold))
                .frame(width: 36, height: 36)
                .foregroundColor(.secondary)
                .background(
                    .ultraThinMaterial,
                    in:
                        RoundedRectangle(cornerRadius: 14, style: .continuous))
            .storkeStyle(cornerRadius: 14)
        }
        .sheet(isPresented: $showSearch, content: {
            SearchView()
        })
    }
    
    var avatarButton: some View {
        Button {
//            showAccount = true
                showModal = true
        } label: {
            Image("Avatar Default")
                .resizable()
                .frame(width: 26, height: 26)
                .cornerRadius(10)
                .padding(8)
                .background(
                    .ultraThinMaterial,
                    in:
                        RoundedRectangle(cornerRadius: 18, style: .continuous))
            .storkeStyle(cornerRadius: 18)
        }
        .sheet(isPresented: $showAccount) {
            AccountView()
        }
    }
}

#Preview {
    NavigationBar(title: "Featured", hasScrolled: .constant(false))
}
