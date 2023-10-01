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
    var logo: String
}

var courses = [
    Course(title: "SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", text: "this is text", image: "Illustration 5", logo: "Logo 2"),
    Course(title: "SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", text: "this is text", image: "Illustration 3", logo: "Logo 4"),
    Course(title: "SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", text: "this is text", image: "Illustration 1", logo: "Logo 1"),
    Course(title: "SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", text: "this is text", image: "Illustration 2", logo: "Logo 3"),
]
