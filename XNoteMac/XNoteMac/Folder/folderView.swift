//
//  folderView.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/5.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa

class FolderView: NSView, NSOutlineViewDelegate, NSOutlineViewDataSource {
    @IBOutlet weak var outLineView : NSOutlineView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outLineView.delegate = self
        outLineView.dataSource = self
    }
    // MARK: - NSOutlineViewDelegate
    // MARK: - NSOutlineViewDataSource
    
    
    
  
}
