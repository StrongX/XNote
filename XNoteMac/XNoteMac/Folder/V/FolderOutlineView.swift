//
//  FolderOutlineView.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/8/8.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa

class FolderOutlineView: NSOutlineView {

    override func willOpenMenu(_ menu: NSMenu, with event: NSEvent) {
        if (clickedRow > -1) {
            selectRowIndexes([clickedRow], byExtendingSelection: false)
        }
    }
    
}
