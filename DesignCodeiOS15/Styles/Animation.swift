//
//  Animations.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/10/1.
//

import SwiftUI

extension Animation {
    static let opencard = Animation.spring(response: 0.3, dampingFraction: 0.7)
    static let closecard = Animation.spring(response: 0.2, dampingFraction: 0.7)
}
