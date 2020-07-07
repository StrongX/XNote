//
//  MenuView.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/5.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa

class MenuView: NSView {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor(calibratedRed: 251/255.0, green: 251/255.0, blue: 251/255.0, alpha: 1).cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
