//
//  FolderItem.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/8/3.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Foundation

class FolderItem {
    var title = ""
    var icon = ""
    
    init(url:URL? = nil) {
        if let u = url {
            self.title = u.lastPathComponent
        }
    }
}
