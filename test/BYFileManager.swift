
//
//  BYFileManager.swift
//  test
//
//  Created by olderor on 15.01.17.
//  Copyright © 2017 olderor. All rights reserved.
//

import Foundation

class BYFileManager {
    static func readFile(path: String) -> String {
        do {
            let text = try String(contentsOfFile: path + ".txt")
            return text
        } catch {
            print("Failed to read from the file '\(path)'")
            return ""
        }
    }
    
    static func writeFile(path: String, content: String) {
        do {
            try content.write(toFile: path + ".txt", atomically: false, encoding: String.Encoding.utf8)
        } catch {
            print("Failed to write to the file '\(path)'")
        }
    }
}
