//
//  FileManager.swift
//  Map
//
//  Created by HEMANTH on 22/01/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
