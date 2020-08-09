//
//  MenuView.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/5.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa

class MenuView: NSView {
    var folderItem : Any? {
        didSet{
            reloadTable()
        }
    }
    
    var dataArr : [Note] = []
    
    
    @IBAction func fileMenuNewNote(_ sender: Any) {
        if let item = folderItem as? FolderItem {
            Storage.shared.createNewNote(folderUrl: item.url)
        }
    }
    
    //MARK: - Private
    
    func reloadTable() {
        if let item = folderItem as? FolderItem {
            dataArr = MenuViewVM.getMenuListData(folderUrl: item.url!)
        }
    }
}
