//
//  OutlineHeaderView.swift
//  XNoteMac
//
//  Created by xlx on 2020/7/31.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa

class OutlineHeaderView: NSView {
    override func draw(_ dirtyRect: NSRect) {
       super.draw(dirtyRect)

       let lightColor = NSColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
       let darkColor = NSColor(red:0.16, green:0.17, blue:0.18, alpha:1.0)

       if NSAppearance.current.isDark {
          darkColor.setFill()
       } else {
          lightColor.setFill()
       }

       dirtyRect.fill()
    }
}
