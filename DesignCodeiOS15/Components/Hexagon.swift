//
//  Hexagon.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/9/24.
//

import SwiftUI

struct HexagonView: View {
    var body: some View {
        Canvas { context, size in
//            context.draw(Text("design code").foregroundColor(.red).font(.title), at: CGPoint(x: 0, y: 0))
//            context.fill(Path(ellipseIn: CGRect(x: 0, y: 100, width: 100, height: 100)), with: .color(.red))
//            context.draw(Image("Blob 1"), in: CGRect(x: 0, y: 200, width: 100, height: 100))
            context.draw(Image(systemName: "hexagon.fill"), in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
        .frame(width: 200, height: 212)
        .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    HexagonView()
}
