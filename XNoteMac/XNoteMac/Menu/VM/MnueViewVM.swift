//
//  MnueViewVM.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/19.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa

class MenuViewVM {
    static func getMenuListData(folderUrl:URL) -> [Note] {
        let urls = Storage.shared.getSubNoteFile(url: folderUrl)
        var notes : [Note] = []
        urls?.forEach({ (url) in
            notes.append(Note(url:url.standardized!))
        })
        return notes
    }
}
