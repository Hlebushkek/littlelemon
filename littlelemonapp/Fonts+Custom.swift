//
//  Fonts+Custom.swift
//  littlelemonapp
//
//  Created by Hlib Sobolevskyi on 2024-07-05.
//

import SwiftUI

extension Font {
    static func markazi(size: CGFloat) -> Font {
        return Font.custom("MarkaziText-Regular", size: size)
    }
    
    static func markazi(style: UIFont.TextStyle) -> Font {
        return .custom("MarkaziText-Regular", size: UIFont.preferredFont(forTextStyle: style).pointSize)
    }
    
    static func markazi(size: CGFloat, relativeTo: TextStyle) -> Font {
        return Font.custom("MarkaziText-Regular", size: size, relativeTo: relativeTo)
    }
}

