//
//  File.swift
//  
//
//  Created by Nail Galiaskarov on 3/19/21.
//

import Foundation

extension String {
    var fullRange: Range<Index> {
        return startIndex..<endIndex
    }
    
    var fullNSRange: NSRange {
        return NSRange(fullRange, in: self)
    }
}

extension String {
    func match(for regex: String) -> String? {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(
                in: self,
                range: NSRange(startIndex..., in: self)
            )
            let matches = results.map {
                String(self[Range($0.range, in: self)!])
            }
            return matches.first
        } catch {
            return nil
        }
    }

}
