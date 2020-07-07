//
//  AppDelegate.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/5.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let window = NSApplication.shared.windows.first
        window?.setContentSize(NSMakeSize(1200, 800))
        window?.center()
        window?.showsToolbarButton = true
        window?.setContentSize(NSMakeSize(1200, 800))
        window?.minSize = NSMakeSize(800, 500)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

