//
//  Styles.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/9/20.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    var cornerRadius: CGFloat
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(
                cornerRadius: cornerRadius,
                style: .continuous
            )
            .stroke(
                .linearGradient(
                    colors: [
                        .white.opacity(colorScheme == .light ? 0.3 : 0.6), // 黑色主题时突出白色线条
                        .black.opacity(colorScheme == .light ? 0.1 : 0.2)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .blendMode(.overlay)
        )
    }
}

extension View {
    func storkeStyle(cornerRadius: CGFloat = 20.0) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}
