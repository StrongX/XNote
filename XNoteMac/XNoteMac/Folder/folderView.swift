//
//  folderView.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/5.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa

class FolderView: NSView {
    lazy var scrollview : NSScrollView = {
        let scroll = NSScrollView()
        scroll.scrollerStyle = .overlay
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    let height : CGFloat = 88
    var content:NSView = NSView()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor(calibratedRed: 47/255.0, green: 50/255.0, blue: 53/255.0, alpha: 1).cgColor
        
        self._configSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func _configSubview() {
        self.addSubview(self.scrollview)
        self.scrollview.translatesAutoresizingMaskIntoConstraints = false
        self.scrollview.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.scrollview.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.scrollview.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        self.scrollview.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        let dataSource = FolderViewVM.getFolderRowModel()
        let rows = FolderViewVM.getFolderRows(dataSource: dataSource)
        

        self.content = FolderViewVM.getContextView(rows: rows, height: height)
        self.scrollview.documentView = self.content
    }
    
}
