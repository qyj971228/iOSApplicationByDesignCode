//
//  SearchView.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/10/3.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var showCourseView = false
    @State var selectedCourse = courses[0]
    @Namespace var namespace
    @Environment(\.presentationMode) var presentationMode
    
    func listFilter(courses: [Course]) -> [Course] {
        // 遍历书写在一行的话，使用 $0 作为每一项的内容
        // 搜索框为空时显示每一项
        return searchText == "" ? courses : courses.filter { $0.title.contains(searchText) }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                content
                    .padding(20)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .storkeStyle(cornerRadius: 30)
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(
                        Rectangle()
                            .fill(.regularMaterial)
                            .frame(height: 400)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                            .blur(radius: 50)
                            .offset(y: -400)
                    )
                    .background(
                        Image("Blob 1")
                            .offset(x: -100, y: -200)
                    )
            }
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: Text("Swift UI, React, UIDesign"),
                suggestions: {
                    if searchText == "" {
                        ForEach(suggestions) { suggestion in
                            Button {
                                searchText = suggestion.text
                            } label: {
                                Text(suggestion.text).searchCompletion(suggestion.text)
                            }
                        }
                    }
                }
            )
            .navigationTitle("search")
            .navigationBarTitleDisplayMode(.inline) // 标题一直以缩小的方式显示在上方
            .navigationBarItems(
                trailing:
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label : {
                        Text("Done").bold()
                    }
            )
        }
    }
    
    var content: some View {
        VStack (alignment: .leading) {
            ForEach (
                Array(listFilter(courses: courses).enumerated()),
                id: \.offset
            ) { index, course in
                if (index != 0) {
                    Divider()
                }
                Button {
                    showCourseView = true
                    selectedCourse = course
                } label: {
                    HStack (alignment: .top, spacing: 15){
                        Image(course.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 44, height: 44)
                            .background(Color("Background"))
                            .mask(Circle())
                        VStack (alignment: .leading, spacing: 4) {
                            Text(course.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Text(course.text)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                        }
                        Spacer()
                            .frame(width: 0)
                    }
                }
                .padding(.vertical, 4)
                .sheet(isPresented: $showCourseView) {
                    CourseView(namespace: namespace, show: $showCourseView, course: selectedCourse)
                }
            }
        }
    }
}

#Preview {
    SearchView()
        .environmentObject(Model())
}
