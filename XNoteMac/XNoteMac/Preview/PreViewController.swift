//
//  PreViewController.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/26.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa
import RxSwift
import RxCocoa

class PreViewController: NSViewController, NSSplitViewDelegate {

    @IBOutlet weak var splitView: NSSplitView!
    @IBOutlet weak var inputView: PreInputView!
    @IBOutlet weak var outputView: PreOutputView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.splitView.delegate = self
        self.inputView.editView.rx.string.subscribe(onNext: { [weak self] (string) in
            self?.outputView.loadHtmlWithMarkDown(markdown: string)
        })
    }
    
    func splitView(_ splitView: NSSplitView, constrainMinCoordinate proposedMinimumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        return 400
    }
    
    func splitView(_ splitView: NSSplitView, constrainMaxCoordinate proposedMaximumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        return self.splitView.frame.width - 400
    }
    
    func splitViewDidResizeSubviews(_ notification: Notification) {
        let firstView = splitView.subviews[0]
        let firstFrame = firstView.frame
        if firstFrame.width < 400 {
            firstView.frame = NSMakeRect(firstFrame.minX, firstFrame.minY, 400, firstFrame.height)
        }
        
        let secondView = splitView.subviews[1]
        let secondFrame = secondView.frame
        if secondFrame.width < 400 {
            secondView.frame = NSMakeRect(secondFrame.maxX - 400, secondFrame.minY, 400, secondFrame.height)
        }
    }
    

    
}
