//
//  AutoWidthField.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/19.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa

class MenuListDescField: NSTextField {
    
    func fitFontSize(maxSize : NSSize = NSSize.zero){
        var text = self.stringValue
        var newSize = NSSize.zero
        self.sizeToFit()
        newSize = self.frame.size
        var width = newSize.width;
        var height = newSize.height;
        let characterSize = width/CGFloat(text.count)
        if maxSize.width > 0{
            if width > maxSize.width{
                width = maxSize.width
                var count = Int(maxSize.width / characterSize)
                let array = text.components(separatedBy: " ")
                var newString = ""
                var heightCount = 1;
                if array.count > 1{
                    var currentCount = 0
                    for i in 0..<array.count{
                        if currentCount + array[i].count > count{
                            newString += "\n"
                            heightCount += 1;
                            currentCount = 0
                        }
                        newString += array[i] + " "
                        currentCount += array[i].count + 1
                    }
                    text = newString
                }else{
                    while count < text.count{
                        text.insert("\n", at: String.Index(encodedOffset: count))
                        count += count + 1
                    }
                }
                height = height * CGFloat(heightCount)
            }
        }
        self.stringValue = text
        self.frame.size = NSSize(width: width, height: height)
    }
    
}
