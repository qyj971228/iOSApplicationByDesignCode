//
//  CustomTabbar.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/9/26.
//

import SwiftUI

struct CustomTabbar: View {
//    @State var selectedTab: Tab = .home
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @State var color: Color = .teal
    @State var tabItemWidth: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            HStack {
                ForEach(tabItems) { item in
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            selectedTab = item.tab
                            color = item.color
                        }
                    } label: {
                        VStack(spacing: 0) {
                            Image(systemName: item.icon)
                                .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .font(.body.bold())
                                .frame(width: 60, height: 30)
                            Text(item.text)
                                .font(.caption2)
                                .lineLimit(1)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
                    .blendMode(selectedTab == item.tab ? .overlay : .normal)
                    // 通过overlay或者background的GeometryReader获取宽度并存储在实现了PreferenceKey的结构体上
                    .background(
                        GeometryReader { proxy in
                            Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                        }
                    )
                    // PreferenceKey变化监听
                    .onPreferenceChange(TabPreferenceKey.self) {
                        value in
                        tabItemWidth = value
                    }
                }
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
            .frame(height: 100, alignment: .center)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 40, style: .continuous))
            .background(
                background
            )
            .overlay(
                overlay
            )
            .storkeStyle(cornerRadius: 40)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
    
    var background: some View {
        HStack {
            if (selectedTab == .library) {
                Spacer()
            }
            if (selectedTab == .explore) {
                Spacer()
            }
            if (selectedTab == .notifications) {
                Spacer()
                Spacer()
            }
            Circle().fill(color).frame(width: tabItemWidth)
            if (selectedTab == .notifications) {
                Spacer()
            }
            if (selectedTab == .home) {
                Spacer()
            }
            if (selectedTab == .explore) {
                Spacer()
                Spacer()
            }
        }
            .padding(.horizontal, 10)
    }
    
    var overlay: some View {
        HStack {
            if (selectedTab == .library) {
                Spacer()
            }
            if (selectedTab == .explore) {
                Spacer()
            }
            if (selectedTab == .notifications) {
                Spacer()
                Spacer()
            }
            Rectangle()
                .fill(color)
                .frame(width: 28, height: 5)
                .cornerRadius(10)
                .frame(width: tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)
            if (selectedTab == .notifications) {
                Spacer()
            }
            if (selectedTab == .home) {
                Spacer()
            }
            if (selectedTab == .explore) {
                Spacer()
                Spacer()
            }
        }
            .padding(.horizontal, 10)
    }
}

#Preview {
    CustomTabbar()
}
