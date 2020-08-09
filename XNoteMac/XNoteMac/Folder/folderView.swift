//
//  folderView.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/5.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa
import SnapKit

class FolderView: NSView, NSOutlineViewDataSource, NSOutlineViewDelegate {
    @IBOutlet weak var outLineView : NSOutlineView!
    @IBOutlet weak var headerView : NSView!

    var dataArr : [FolderSection] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer?.backgroundColor = NSColor(red:0.96, green:0.96, blue:0.96, alpha:1.0).cgColor
        outLineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(headerView.snp_bottomMargin)
        }
        
        outLineView.delegate = self
        outLineView.dataSource = self
        reloadOutLineView()
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
    
    
    // MARK: - IBAction
    @IBAction func addProject(_ sender: Any) {
        let alert = NSAlert()
        let field = NSTextField(frame: NSRect(x: 0, y: 0, width: 290, height: 20))
        alert.messageText = NSLocalizedString("New project", comment: "")
        alert.informativeText = NSLocalizedString("Please enter project name:", comment: "")
        alert.accessoryView = field
        alert.alertStyle = .informational
        alert.addButton(withTitle: NSLocalizedString("Add", comment: ""))
        alert.addButton(withTitle: NSLocalizedString("Cancel", comment: ""))
        alert.beginSheetModal(for: self.window!) { (returnCode: NSApplication.ModalResponse) -> Void in
            if returnCode == NSApplication.ModalResponse.alertFirstButtonReturn {
                self.addChild(field: field)
            }
        }
        
        field.becomeFirstResponder()
    }
    
    @IBAction func revealInFinder(_ sender: Any) {
        let selectedObject = getFolderItem()
        
        if let item = selectedObject as? FolderItem {
            NSWorkspace.shared.selectFile(nil, inFileViewerRootedAtPath: item.url!.path)
        } else {
            NSWorkspace.shared.selectFile(nil, inFileViewerRootedAtPath: Storage.shared.localDocumentsContainer!.path)
        }
        
    }
    
    // MARK: - Private
    private func addChild(field: NSTextField) {
        let value = field.stringValue
        guard value.count > 0 else { return }
        
        do {
            let folderURL = Storage.shared.localDocumentsContainer?.appendingPathComponent(value, isDirectory: true)
            try FileManager.default.createDirectory(at: folderURL!, withIntermediateDirectories: false, attributes: nil)
            reloadOutLineView()
        } catch {
            let alert = NSAlert()
            alert.messageText = error.localizedDescription
            alert.runModal()
        }
    }
    
    private func reloadOutLineView() {
        self.dataArr = FolderViewVM.getFolderSection()
        self.outLineView.reloadData()
        dataArr.forEach { (section) in
            outLineView.expandItem(section)
        }
    }
    
    private func getFolderItem() -> Any? {
        var selected = self.outLineView.selectedRow
        for section in dataArr {
            if selected <= 0 {
                return section
            } else if (selected < section.children.count + 1) {
                return section.children[selected - 1]
            } else {
                selected -= (section.children.count+1)
            }
        }
        return nil
    }
    
}
