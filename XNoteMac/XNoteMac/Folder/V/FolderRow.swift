//
//  FolderRow.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/14.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa

class FolderRow: NSView {
    lazy var titleLabel : NSTextField = {
        let label = NSTextField()
        label.isEditable = false
        return label
    }()
    
    var model : FolderRowModel = FolderRowModel(){
        didSet {
            self.titleLabel.stringValue = model.title
        }
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        self._configSubview()
    }
    
    func _configSubview() {
        self.addSubview(self.titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true;
        self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
        self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true;
        self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true;
    }
    
    
    
}
