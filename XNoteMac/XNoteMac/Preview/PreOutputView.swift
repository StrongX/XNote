//
//  PreOutputView.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/26.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa
import WebKit

class PreOutputView: NSView {
    @IBOutlet weak var webview: WKWebView!

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    func loadHtmlWithMarkDown(markdown: String) {
        let htmlString = renderMarkdownHTML(markdown: markdown)!
        self.webview.loadHTMLString(htmlString, baseURL: nil);
    }
    
}
