//
//  DesignCodeiOS15App.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/9/19.
//

import SwiftUI

@main
struct DesignCodeiOS15App: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model) // 注入响应数据
        }
    }
}
