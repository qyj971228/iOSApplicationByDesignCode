//
//  Course.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/10/1.
//

import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
}

var courses = [
    Course(title: "SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", text: "this is textthis is textthis is textthis is textthis is textthis is textthis is textthis is textthis is texts textthis is texts textthis is texts textthis is texts textthis is texts textthis is texts textthis is texts textthis is texts textthis is texts textthis is text", image: "Illustration 9", background: "Background 5", logo: "Logo 2"),
    Course(title: "UI Design for iOS 15", subtitle: "20 sections - 3 hours", text: "this is textthis is textthis is textthis is textthis is textthis is textthis is textthis is textthis is text", image: "Illustration 3", background: "Background 3", logo: "Logo 4"),
    Course(title: "Flutter for designers", subtitle: "20 sections - 3 hours", text: "this is textthis is textthis is textthis is textthis is textthis is textthis is textthis is textthis is text", image: "Illustration 1", background: "Background 4", logo: "Logo 1"),
    Course(title: "React Hooks Advanced", subtitle: "20 sections - 3 hours", text: "this is textthis is textthis is textthis is textthis is textthis is textthis is textthis is textthis is text", image: "Illustration 2", background: "Background 1", logo: "Logo 3"),
]

var featuredCourses = [
    Course(title: "SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", text: "this is text", image: "Illustration 5", background: "Background 5", logo: "Logo 2"),
    Course(title: "UI Design for iOS 15", subtitle: "20 sections - 3 hours", text: "this is text", image: "Illustration 3", background: "Background 5", logo: "Logo 4"),
    Course(title: "Flutter for designers", subtitle: "20 sections - 3 hours", text: "this is text", image: "Illustration 1", background: "Background 5", logo: "Logo 1"),
    Course(title: "React Hooks Advanced", subtitle: "20 sections - 3 hours", text: "this is text", image: "Illustration 2", background: "Background 5", logo: "Logo 3"),
]
