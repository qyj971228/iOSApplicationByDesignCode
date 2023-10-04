//
//  HomeView.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/10/1.
//

import SwiftUI

struct HomeView: View {
    @State var hasScrolled = false
    @Namespace var namespace
    @State var show = false
    @State var showStatusBar = true
    @State var selectedId = UUID()
    @EnvironmentObject var model: Model
    @State var selectedFeauredCourse = featuredCourses[0]
    @State var isShowSearchView = false
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            ScrollView {
                
                scrollDetetion
                
                featured
                
                Courses()
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 20)], spacing: 20) {
                    if !show {
                        cards
                    } else {
                        // 展示卡片内容时原地生成占位元素
                        ForEach(courses) { course in
                            Rectangle()
                                .fill(.white)
                                .frame(height: 300)
                                .cornerRadius(30)
                                .shadow(color: Color("shadow"), radius: 30, x: 0, y: 10)
                                .opacity(0.3)
                                .padding(.horizontal, 30)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 50)
            })
            .overlay(
                NavigationBar(title: "Home", hasScrolled: $hasScrolled)
            )
            if show {
                details
            }
        }
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation(.closecard) {
                if newValue {
                    showStatusBar = false
                } else {
                    showStatusBar = true
                }
            }
        }
        .sheet(isPresented: $isShowSearchView, content: {
            CourseView(namespace: namespace, show: $isShowSearchView, course: selectedFeauredCourse)
        })
    }
    
    var scrollDetetion: some View {
        GeometryReader { proxy in
            // Text("\(proxy.frame(in: .named("scroll")).minY)")
            // .global相对于屏幕 .local相对于parent .named相对于自定义参照位置
            Color.clear.preference(key: ScrollpreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollpreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = true
                } else {
                    hasScrolled = false
                }
            }
        })
        
    }
    
    var featured: some View {
        TabView {
            ForEach(featuredCourses) { course in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    FeatureItem(course: course)
                        .frame(maxWidth: 500)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 40)
                        .rotation3DEffect(
                            .degrees(minX / 10),
                            axis: (x: 0, y: -1, z: 0)
                        )
                        .blur(radius: abs(minX / 100))
                        .shadow(color: Color("Shadow").opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 0) // 阴影在三维变化之后再渲染
                        .overlay(
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(x: 32, y: -90)
                                .offset(x: minX / 2)
                        )
                        .onTapGesture {
                            isShowSearchView = true
                            selectedFeauredCourse = course
                        }
                    // Text("\(proxy.frame(in: .global).minX)")
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(Image("Blob 1").offset(x: 200, y: -100))
    }
    
    var cards: some View {
        ForEach(courses) { course in
            CourseItem(namespace: namespace, show: $show, course: course)
                .onTapGesture {
                    withAnimation(.opencard) {
                        show.toggle()
                        model.showDetail.toggle()
                        showStatusBar = false
                        selectedId = course.id
                    }
                }
        }
    }
    
    var details: some View {
        ForEach(courses) { course in
            if course.id == selectedId {
                CourseView(namespace: namespace, show: $show, course: course)
                    .zIndex(1) // 叠放到上方以显示收起动画
                //  .transition(.opacity.animation(.easeInOut(duration: 0.3)))
                    .transition(.asymmetric(
                        insertion: .opacity.animation(.easeInOut(duration: 0.3)),
                        removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))))
            }
        }
    }
}

#Preview {
    HomeView()
    //        .preferredColorScheme(.dark)
        .environmentObject(Model())
}

struct Courses: View {
    var body: some View {
        Text("Courses".uppercased())
            .font(.footnote.weight(.semibold))
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
    }
}
