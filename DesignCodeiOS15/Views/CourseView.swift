//
//  CourseItem.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/10/1.
//

import SwiftUI

struct CourseView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    @State var appear = [false, false, false]
    var course: Course = courses[0]
    @EnvironmentObject var model: Model
    @State var viewState: CGSize = .zero
    @State var isDraggable = true
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                content
                    .offset(y: 100)
                    .padding(.bottom, 200)
                    .opacity(appear[2] ? 1 : 0)
            }
            .coordinateSpace(name: "scroll")
//            .background(Color("Background"))
//            .mask(
//                RoundedRectangle(
//                    cornerRadius: viewState != .zero ? viewState.width / 3 : 0,
//                    style: .continuous
//                )
//            )
            .shadow(color: .black.opacity(0.3), radius: 30, x: 0, y: 10)
//            .scaleEffect(viewState.width / -500 + 1)
//            .background(.black.opacity(viewState.width / 500))
//            .background(.ultraThinMaterial)
            .background(!show ? Color.clear : Color("Background"))
            .gesture(
                isDraggable ? drag : nil
            )
            .ignoresSafeArea(.all)
            .safeAreaInset(
                edge: .bottom,
                content: {
                    Color.clear.frame(height: 0)
                }
            )
            .onChange(of: show) { newValue in
                fadeOut()
            }
            button
        }
        .onAppear {
            model.showDetail = true
            fadeIn()
        }
        .onDisappear {
            model.showDetail = false
        }
    }
    
    var content: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(course.subtitle)
                    .font(.title3).fontWeight(.medium)
                Text(course.title)
                    .font(.title).fontWeight(.bold)
                Text(course.text)
            }
            .padding(20)
            Spacer()
        }
        .padding(.horizontal, 5)
    }
    
    var button: some View {
        Button {
            withAnimation(.closecard) {
                model.showDetail.toggle()
                show.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
    
    var cover: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("scroll")).minY
            let scrollVal = scrollY > 0 ? scrollY : 0
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 500 + scrollVal)
            .foregroundColor(.black)
            .background(
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .frame(maxWidth: 500)
                    .matchedGeometryEffect(id: "image\(course.id)", in: namespace)
                    .offset(y: -scrollVal * 0.8)
            )
            .background(
                Image(course.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "background\(course.id)", in: namespace)
                    .offset(y: -scrollVal)
                    .scaleEffect(scrollVal / 1000 + 1)
                    .blur(radius: scrollY / 10)
            )
            .mask(
                RoundedRectangle(cornerRadius: appear[0] ? 0 : 30, style: .continuous)
                    .matchedGeometryEffect(id: "mask\(course.id)", in: namespace)
                    .offset(y: -scrollVal)
            )
            .overlay(
                overlayContent
                    .offset(y: -scrollVal * 0.6)
            )
        }
        .frame(height: 500)
    }
    
    var overlayContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(course.title)
                .font(.largeTitle.weight(.bold))
                .matchedGeometryEffect(id: "title\(course.id)", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(course.subtitle.uppercased())
                .font(.footnote.weight(.semibold))
                .matchedGeometryEffect(id: "subtitle\(course.id)", in: namespace)
            Text(course.text)
                .font(.footnote)
                .matchedGeometryEffect(id: "text\(course.id)", in: namespace)
                .lineLimit(2)
            Divider()
                .opacity(appear[0] ? 1 : 0)
            HStack {
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
                Text("Taught by Meng To")
                    .font(.footnote)
            }
            .opacity(appear[1] ? 1 : 0)
        }
        .padding(20)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                )
                .matchedGeometryEffect(id: "blur\(course.id)", in: namespace)
        )
        .offset(y: 250)
        .padding(20)
    }
    
    var drag: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged { value in
                guard value.translation.width > 0 else { return }
                
                if value.startLocation.x < 100 {
                    withAnimation(.closecard) {
                        viewState = value.translation
                    }
                }
                if viewState.width > 160 {
                    close()
                }
            }
            .onEnded { value in
                if viewState.width > 80 {
                    close()
                } else {
                    withAnimation(.closecard) {
                        viewState = .zero
                    }
                }
            }
    }
    
    func fadeIn() {
        withAnimation(.easeOut.delay(0.3)) {
            appear[0] = true
        }
        withAnimation(.easeOut.delay(0.4)) {
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.5)) {
            appear[2] = true
        }
    }
    
    func fadeOut() {
        appear[0] = false
        appear[1] = false
        appear[2] = false
    }
    
    func close() {
        withAnimation(.closecard) {
            show.toggle()
            model.showDetail.toggle()
        }
//        withAnimation(.closecard) {
//            viewState = .zero
//        }
        isDraggable = false
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseView(namespace: namespace, show: .constant(true))
            .environmentObject(Model())
    }
}
