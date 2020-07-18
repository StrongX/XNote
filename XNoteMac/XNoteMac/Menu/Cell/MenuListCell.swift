//
//  MenuListCell.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/19.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa
import SnapKit
class MenuListCell: NSTableCellView {
    lazy var titleLabel : MenuListDescField = {
        let field = MenuListDescField()
        field.isEditable = false
        field.isBordered = false
        field.lineBreakMode = .byCharWrapping
        return field
    }()
    
    var model : MenuViewModel
    
    init(frame frameRect: NSRect, model: MenuViewModel) {
        self.model = model
        super.init(frame: frameRect)
        self._configSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func _configSubviews() {
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(10)
        }
        self.titleLabel.stringValue = self.model.title
        self.titleLabel.frame = NSMakeRect(0, 0, 100, 100)
//        self.titleLabel.fitFontSize(maxSize: NSMakeSize(80, 80))
        
    }
    
    override var backgroundStyle: NSView.BackgroundStyle {
        set {
            if let rowView = self.superview as? NSTableRowView {
                super.backgroundStyle = rowView.isSelected ? NSView.BackgroundStyle.dark : NSView.BackgroundStyle.light
            }
            self.titleLabel.fitFontSize(maxSize: NSMakeSize(self.frame.width - 20, self.frame.height - 20))
        }
        get {
            return super.backgroundStyle;
        }
    }
    
}
