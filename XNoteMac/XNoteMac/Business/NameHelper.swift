//
//  NameHelper.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/8/9.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Foundation

class NameHelper {
    public static func getUniqueFileName(name: String = "", postfix: Int = 0, ext: String = "md", folderUrl: URL) -> URL {
        let defaultName = UUID().uuidString
        var postfix = postfix
        var name = name
            .trimmingCharacters(in: CharacterSet.whitespaces)
            .replacingOccurrences(of: ":", with: "-")
            .replacingOccurrences(of: "/", with: ":")

        if name.isEmpty {
            name = defaultName
        }

        var fileUrl = folderUrl
        fileUrl.appendPathComponent(name)
        fileUrl.appendPathExtension(ext)

        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: fileUrl.path) {
            let regex = try? NSRegularExpression(pattern: "(.+)\\s(\\d)+", options: .caseInsensitive)

            if let result = regex?.firstMatch(in: name, range: NSRange(0..<name.count)) {

                if let range = Range(result.range(at: 1), in: name) {
                    name = String(name[range])
                }

                if let range = Range(result.range(at: 2), in: name) {
                    let digit = name[range]

                    if let converted = Int(digit) {
                        postfix = converted
                    }
                }
            }

            let increment = postfix + 1
            let newName = name + " " + String(increment)
            return NameHelper.getUniqueFileName(name: newName, postfix: increment, ext: ext, folderUrl: folderUrl)
        }

        return fileUrl
    }
}
