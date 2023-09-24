//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/9/20.
//

import SwiftUI

struct AccountView: View {
    @State var isAppleLinkDeleted = false
    @State var isAppleLinkPanned = false
    
    var body: some View {
        //        NavigationView {
        //            List(0 ..< 5) { item in
        //                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //                    .listRowSeparatorTint(.blue) // 分隔符
        //                    .listRowSeparator(.hidden)
        //            }
        //            .listStyle(.insetGrouped)
        //            .navigationTitle("Account")
        //        }
        NavigationView {
            List {
                profile
                menu
                link
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
    
    var profile: some View {
        VStack{
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.green, .blue)
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
            Text("User Name")
                .font(.title.weight(.bold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.large)
                    .foregroundColor(.secondary)
                Text("Country")
                    .foregroundColor(.secondary)
            }
        }
        .padding(.all, 5)
        .frame(maxWidth: .infinity)
    }
    
    var menu: some View {
        Section {
            NavigationLink(destination: ContentView()) {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink {
                Text("Billing")
            } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink {
                Text("Help")
            } label: {
                Label("Help", systemImage: "questionmark")
            }
        }
        .foregroundColor(.primary)
    }
    
    var link: some View {
        Section {
            if !isAppleLinkDeleted {
                Link(destination: /*@START_MENU_TOKEN@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/, label: {
                    HStack {
                        Label("Apple", systemImage: "apple.logo")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                })
                .foregroundColor(.primary)
                .swipeActions (edge: .trailing, allowsFullSwipe: false) {
                    Button(action: {
                        isAppleLinkDeleted = true
                    }, label: {
                        Label("Delete", systemImage: "trash")
                    })
                    .tint(.red)
                    pinButton
                }
            }
            Link(destination: /*@START_MENU_TOKEN@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/, label: {
                HStack {
                    Label("TouTube", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            })
            .foregroundColor(.primary)
            .swipeActions (edge: .trailing, allowsFullSwipe: false) {
                pinButton
            }
        }
    }
    
    var pinButton: some View {
        Button(action: {
            isAppleLinkPanned.toggle()
        }, label: {
            if !isAppleLinkPanned {
                Label("Unpin", systemImage: "pin.slash")
            } else {
                Label("Pin", systemImage: "pin")
            }
        })
        .tint(isAppleLinkPanned ? .yellow : .secondary)
    }
}

#Preview {
    AccountView()
}
