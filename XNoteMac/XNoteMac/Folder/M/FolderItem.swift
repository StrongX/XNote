//
//  FolderItem.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/8/3.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Foundation

class FolderItem: NSObject {
    var title = ""
    var icon = ""
    var url: URL? = nil
    
    init(url:URL? = nil) {
        if let u = url {
            self.url = u
            self.title = u.lastPathComponent
        } else {
            self.url = Storage.shared.localDocumentsContainer
        }
    }
}
