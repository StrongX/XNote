//
//  HomeView.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/5.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa
import RxSwift
import RxCocoa

class HomeViewController: NSViewController, NSSplitViewDelegate {
    
    @IBOutlet weak var splitView : NSSplitView!
    @IBOutlet weak var folderView : FolderView!
    @IBOutlet weak var menuView : MenuView!
    
    let folderDispose = DisposeBag()
    
    let minFolderWidth : CGFloat = 250.0
    let minMenuWidth : CGFloat = 250.0
    let minDetailWidth : CGFloat = 250.0

    let maxFolderWidth : CGFloat = 400.0
    let maxMenuWidth : CGFloat = 400.0

    override func viewDidLoad() {
        // add splitView
        
        self.splitView.delegate = self        
        
        folderView.rx.observe(AnyClass.self, #keyPath(FolderView.currentItem)).subscribe(onNext: { [weak self] _ in
            self?.menuView.folderItem = self?.folderView.currentItem
        }).disposed(by: folderDispose)
    }
    
    func splitView(_ splitView: NSSplitView, constrainMaxCoordinate proposedMaximumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        if dividerIndex == 0 {
            return maxFolderWidth
        } else {
            let firstViewWidth = splitView.arrangedSubviews[0].frame.width
            return firstViewWidth + maxMenuWidth
        }
    }


    func splitView(_ splitView: NSSplitView, resizeSubviewsWithOldSize oldSize: NSSize) {
        let firstViewWidth = splitView.arrangedSubviews[0].frame.width
        let firstPosition = firstViewWidth < minFolderWidth ? minFolderWidth : firstViewWidth
        
        let secondViewWidth = splitView.arrangedSubviews[1].frame.width
        let sectionPosition = ( secondViewWidth < minFolderWidth ? minFolderWidth : secondViewWidth ) + firstPosition

        splitView.adjustSubviews()
        splitView.setPosition(firstPosition, ofDividerAt: 0)
        splitView.setPosition(sectionPosition, ofDividerAt: 1)

    }
    
    func splitViewDidResizeSubviews(_ notification: Notification) {
        let firstView = splitView.arrangedSubviews[0]
        var firstRect = firstView.frame
        var firstViewWidth : CGFloat

        let secondView = splitView.arrangedSubviews[1]
        var secondRect = secondView.frame
        var secondViewWidth : CGFloat
        
        let dividerIndex = notification.userInfo?["NSSplitViewDividerIndex"]
        if (dividerIndex != nil) && dividerIndex! as? Int == 0 {
            if firstRect.width > minFolderWidth {
                firstViewWidth = firstRect.width
                secondViewWidth = secondRect.width < minMenuWidth ? minMenuWidth : secondRect.width
            } else {
                firstViewWidth = minFolderWidth
                if secondRect.width > minMenuWidth {
                    secondViewWidth = secondRect.width - (minFolderWidth - firstRect.width)
                } else {
                    secondViewWidth = minMenuWidth
                }
            }
        } else {
            if secondRect.width < minMenuWidth {
                secondViewWidth = minMenuWidth
                if firstRect.width > minFolderWidth {
                    firstViewWidth = firstRect.width - (minMenuWidth - secondRect.width)
                } else {
                    firstViewWidth = minFolderWidth
                }
            } else {
                firstViewWidth = firstRect.width
                secondViewWidth = secondRect.width
            }
        }
        
        

        firstRect = NSMakeRect(firstRect.origin.x, firstRect.origin.y, firstViewWidth, firstRect.size.height)
        firstView.frame = firstRect

        secondRect = NSMakeRect(firstRect.maxX, secondRect.origin.y, secondViewWidth, secondRect.height)
        secondView.frame = secondRect
        
        let thirdView = splitView.arrangedSubviews[2]
        var thirdRect = thirdView.frame
        if thirdRect.width < minDetailWidth {
//            let window = NSApplication.shared.windows.first!
//            window.setContentSize(NSMakeSize(window.frame.width + (minDetailWidth - thirdRect.width), window.frame.height))

            thirdRect = NSMakeRect(thirdRect.origin.x, thirdRect.origin.y, minDetailWidth, thirdRect.height)
            thirdView.frame = thirdRect
        }


    }
}
