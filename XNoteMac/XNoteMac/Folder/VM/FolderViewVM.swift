//
//  FolderViewVM.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/14.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa

class FolderViewVM {
    static func getFolderSection() -> [FolderSection] {
        let noteSection = FolderSection()
        noteSection.title = "笔记"
        let item1 = FolderItem()
        item1.title = "iOS"
        let item2 = FolderItem()
        item2.title = "Swift"
        noteSection.children = [item1, item2]
        return [noteSection]
    }
    
}
