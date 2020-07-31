//
//  NSAppearance+Theme.swift
//  XNoteMac
//
//  Created by xlx on 2020/7/31.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import AppKit.NSAppearance

extension NSAppearance {
    var isDark: Bool {
        if self.name == .vibrantDark { return true }

        guard #available(macOS 10.14, *) else { return false }

        switch self.name {
        case .accessibilityHighContrastDarkAqua,
             .darkAqua,
             .accessibilityHighContrastVibrantDark:
            return true
        default:
            return false
        }
    }
}
