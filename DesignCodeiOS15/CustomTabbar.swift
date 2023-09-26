//
//  CustomTabbar.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/9/26.
//

import SwiftUI

struct CustomTabbar: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            ContentView()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            HStack {
                Spacer()
                VStack(spacing: 0) {
                    Image(systemName: "house")
                        .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .font(.body.bold())
                        .frame(width: 60, height: 30)
                    Text("Learn Now")
                        .font(.caption2)
                }
                Spacer()
                VStack(spacing: 0) {
                    Image(systemName: "magnifyingglass")
                        .frame(width: 60, height: 30)
                    Text("Explore")
                        .font(.caption2)
                }
                Spacer()
            }
            .padding(.all, 10)
            .frame(height: 100, alignment: .center)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 40, style: .continuous))
            .storkeStyle(cornerRadius: 40)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    CustomTabbar()
}
