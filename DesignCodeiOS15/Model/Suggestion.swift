//
//  Suggestion.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/10/3.
//

import SwiftUI

struct Suggestion: Identifiable {
    let id = UUID()
    var text: String
}

var suggestions = [
    Suggestion(text: "SwiftUI"),
    Suggestion(text: "React"),
    Suggestion(text: "Design")
]
