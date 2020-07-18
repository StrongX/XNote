//
//  MenuView.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/5.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa

class MenuView: NSView ,NSTableViewDelegate, NSTableViewDataSource{
    
    lazy var scrollview : NSScrollView = {
        let scroll = NSScrollView()
        scroll.scrollerStyle = .overlay
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    lazy var tableView : NSTableView = {
        let table = NSTableView(frame: self.bounds)
        return table
    }()
    
    lazy var tableColumn : NSTableColumn = {
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "menu"))
        return column
    }()
    
    lazy var dataArr : Array = {
        return MenuViewVM.getMenuListData()
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor(calibratedRed: 251/255.0, green: 251/255.0, blue: 251/255.0, alpha: 1).cgColor
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
        
        self.tableView.addTableColumn(self.tableColumn)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
        
        self.scrollview.documentView = self.tableView
        
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        return MenuListCell(frame: NSRect.zero, model: self.dataArr[row])
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 100;
    }
}
