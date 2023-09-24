//
//  ContentView.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/9/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) { // 垂直放置vertical stack 对应的水平放置HStack 叠放ZStack
            Spacer() // 使其他元素浮动
            Image("Logo 2")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .padding(.all, 10.0)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                .storkeStyle(cornerRadius: 10.0)
            Text("Hello, world!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(0.0)
                .foregroundStyle( // 与背景 相对的 前景 swiftui中使用前景来指定字体颜色
                    .linearGradient( // 可随主题变化的线性渐变
                        colors: [.primary, .red],
                        startPoint: .bottomLeading, endPoint: .topTrailing
                    )
                )
            Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/ .uppercased())
                .foregroundStyle(.secondary)
            Text("PlaceholderPlaceholderPlaceholderPlaceholderPlaceholderPlaceholder")
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
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20.0, style: .continuous)) // Material 毛玻璃属性 + ios15风格的连续圆角
//        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/) // 圆角
//        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/) // 图形剪切
//        .mask(Rectangle().frame(width: 400, height: 300).opacity(0.8)) // mask可以指定剪切的透明度
//        .mask(RoundedRectangle(cornerRadius: 20.0, style: .continuous)) // ios15风格的连续圆角
        .shadow(color: Color("Shadow").opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 0)
        .padding(.horizontal, 20) // 如果设置在背景之后那么padding会在背景之外，类似css的margin
        .background(Image("Blob 1").offset(x: 200, y: -100)) // offset 类似transform
        .overlay( // 可以理解为一个上方的background
            Image("Illustration 5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 230)
                .offset(x: 32, y: -90))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // 预览配置 可以设置机型 屏幕大小 主题
//        ContentView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/) // 黑色预览
        ContentView()
    }
}
