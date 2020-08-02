//
//  folderView.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/5.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa

class FolderView: NSView, NSOutlineViewDataSource, NSOutlineViewDelegate {
    @IBOutlet weak var outLineView : NSOutlineView!
    
    lazy var dataArr : [FolderSection] = {
        return FolderViewVM.getFolderSection()
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outLineView.delegate = self
        outLineView.dataSource = self
        dataArr.forEach { (section) in
            outLineView.expandItem(section)
        }
    }
    
    // MARK: - NSOutlineViewDataSource
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if let section = item as? FolderSection {
            return section.children.count
        }
        return dataArr.count
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        if item is FolderSection {
            return true
        }
        return false
    }
    
    
    func outlineView(_ outlineView: NSOutlineView, heightOfRowByItem item: Any) -> CGFloat {
        if item is FolderSection {
            return 44
        } else {
            return 25
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let section = item as? FolderSection {
            return section.children[index]
        }
        return dataArr[index]
    }
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        
        if let section = item as? FolderSection {
            let cell = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "FolderHeaderCell"), owner: self) as! FolderHeaderCell
            cell.titleLabel.stringValue = section.title
            
            return cell
        }
        if let item = item as? FolderItem {
            let cell = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "FolderDataCell"), owner: self) as! FolderDataCell
            cell.titleLabel.stringValue = item.title
            
            return cell
        }
        
        return NSView()
    }
    
    
    // MARK: - NSOutlineViewDelegate
    
    
    
    
    
}
