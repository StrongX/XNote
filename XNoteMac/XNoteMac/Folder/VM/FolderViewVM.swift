//
//  FolderViewVM.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/14.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa

class FolderViewVM {

    class func getFolderRowModel() -> [FolderRowModel] {
        let model1 = FolderRowModel()
        let model2 = FolderRowModel()
        model1.title = "标题1"
        model2.title = "标题2"
        return [model1, model2]
    }
    
    class func getFolderRows(dataSource: [FolderRowModel]) -> [FolderRow] {
        var rows = [FolderRow]()
        for data in dataSource {
            rows.append(FolderViewVM.getFolderRow(data: data))
        }
        return rows
    }
    
    class func getFolderRow(data: FolderRowModel) -> FolderRow {
        let row = FolderRow(frame: NSZeroRect)
        row.model = data
        return row
    }
    
    class func getContextView(rows: [NSView], height: CGFloat) -> NSView {
        var i = 0
        let content = FolderContext(frame: NSMakeRect(0, 0, 0, height * CGFloat(rows.count)))
        for row in rows {
            content.addSubview(row)
            row.translatesAutoresizingMaskIntoConstraints = false
            row.leftAnchor.constraint(equalTo: content.leftAnchor).isActive = true
            row.rightAnchor.constraint(equalTo: content.rightAnchor).isActive = true
            row.topAnchor.constraint(equalTo: content.topAnchor, constant: CGFloat(i)*height).isActive = true
            row.heightAnchor.constraint(equalToConstant: height).isActive = true
            i+=1
        }
        return content
    }
}

class FolderContext:NSView {
    override var isFlipped: Bool {
        return true
    }
}
