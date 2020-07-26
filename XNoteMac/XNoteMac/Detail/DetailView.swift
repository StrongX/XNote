//
//  DetailView.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/7.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa

class DetailView: NSView {
    lazy var scrollView : NSScrollView = {
        let scroll = NSScrollView(frame: NSMakeRect(0, 0, 500, 500))
        scroll.autoresizesSubviews = true
        return scroll
    }()
    
    lazy var editView : NSTextView = {
        let editView = NSTextView(frame: NSMakeRect(0, 0, 500, 500))
        editView.autoresizingMask = .width
        return editView
    }()
    
    lazy var previewBtn : NSButton = {
        let button = NSButton()
        button.title = "实时预览"
        button.target = self
        button.action = #selector(showPreView)
        return button
    }()
    
    lazy var preWindow : NSWindowController = {
        let sb = NSStoryboard.init(name: "Preview", bundle: nil)
        let newWindow = sb.instantiateInitialController() as! NSWindowController
        newWindow.window?.setContentSize(NSMakeSize(1200, 800))
        newWindow.window?.minSize = NSMakeSize(800, 500)
        return newWindow
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self._configSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func _configSubviews() {
        self.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        self.scrollView.documentView = self.editView
        
        self.addSubview(self.previewBtn)
        self.previewBtn.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.right.equalTo(self.snp_rightMargin).offset(-20)
            make.top.equalTo(self.snp_topMargin).offset(20)
        }
        
    }
    
    @objc func showPreView() {
        self.preWindow.window?.center()
        self.preWindow.window?.orderFront(nil)

    }
}
