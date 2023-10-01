//
//  FeatureItem.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/10/1.
//

import SwiftUI

struct FeatureItem: View {
    var course: Course = courses[0]
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) { // 垂直放置vertical stack 对应的水平放置HStack 叠放ZStack
            Spacer() // 使其他元素浮动
            Image(course.logo)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .padding(.all, 10.0)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                .storkeStyle(cornerRadius: 10.0)
            Text(course.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(0.0)
                .foregroundStyle( // 与背景 相对的 前景 swiftui中使用前景来指定字体颜色
                    .linearGradient( // 可随主题变化的线性渐变
                        colors: [.primary, .red],
                        startPoint: .bottomLeading, endPoint: .topTrailing
                    )
                )
            Text(course.subtitle .uppercased())
                .foregroundStyle(.secondary)
            Text(course.text)
                .font(.footnote)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .lineLimit(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20)
        .frame(height: 350.0)
        .storkeStyle()
        .background(.ultraThinMaterial) // Material 毛玻璃属性 + ios15风格的连续圆角
        .mask(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
//        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/) // 圆角
//        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/) // 图形剪切
//        .mask(Rectangle().frame(width: 400, height: 300).opacity(0.8)) // mask可以指定剪切的透明度
//        .mask(RoundedRectangle(cornerRadius: 20.0, style: .continuous)) // ios15风格的连续圆角
        .padding(.horizontal, 20) // 如果设置在背景之后那么padding会在背景之外，类似css的margin
    }
}

#Preview {
    FeatureItem()
}
