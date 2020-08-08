//
//  Storage.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/8/8.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Foundation

class Storage {
    
    static let shared = Storage()
    
    var localDocumentsContainer: URL? {
        get {
            if let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
                return URL(fileURLWithPath: path, isDirectory: true)
            }
            
            return nil
        }
    }
    
    var allowedExtensions = [
        "md", "markdown",
        "txt",
        "rtf",
        "fountain",
        "textbundle",
        "etp" // Encrypted Text Pack
    ]
    
    func getSubFolders(url: URL) -> [NSURL]? {
        guard let fileEnumerator = FileManager.default.enumerator(at: url, includingPropertiesForKeys: nil, options: FileManager.DirectoryEnumerationOptions()) else { return nil }

        var extensions = self.allowedExtensions
        for ext in ["jpg", "png", "gif", "jpeg", "json", "JPG", "PNG", ".icloud"] {
            extensions.append(ext)
        }
        let lastPatch = ["assets", ".cache", "i", ".Trash"]

        let urls = fileEnumerator.allObjects.filter { !extensions.contains(($0 as? NSURL)!.pathExtension!) && !lastPatch.contains(($0 as? NSURL)!.lastPathComponent!) } as! [NSURL]
        var subdirs = [NSURL]()
        var i = 0

        for url in urls {
            i = i + 1

            do {
                var isDirectoryResourceValue: AnyObject?
                try url.getResourceValue(&isDirectoryResourceValue, forKey: URLResourceKey.isDirectoryKey)

                var isPackageResourceValue: AnyObject?
                try url.getResourceValue(&isPackageResourceValue, forKey: URLResourceKey.isPackageKey)

                if isDirectoryResourceValue as? Bool == true,
                    isPackageResourceValue as? Bool == false {
                    subdirs.append(url)
                }
            }
            catch let error as NSError {
                print("Error: ", error.localizedDescription)
            }
            
            if i > 50000 {
                break
            }
        }
        
        return subdirs.sorted { (url1, url2) -> Bool in
            url1.lastPathComponent!.lowercased() < url2.lastPathComponent!.lowercased()
        }
    }
}
