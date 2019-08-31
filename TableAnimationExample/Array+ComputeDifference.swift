//
//  Array+ComputeDifference.swift
//  TableAnimationExample
//
//  Created by Shawn Wu on 8/30/19.
//  Copyright © 2019 Shawn Wu. All rights reserved.
//

import Foundation

extension Array where Element: Hashable {
    static public func computeDifference(current: [Element], new: [Element]) -> ([Int], [Int]) {
        var inserted = [Int]()
        var deleted = [Int]()
        for index in 0..<new.count {
            if index >= current.count {
                inserted.append(index)
                if let idxInCurrent = current.index(of: new[index]) {
                    deleted.append(idxInCurrent)
                }
                continue
            }
            if new[index] != current[index] {
                inserted.append(index)
                if let idxInCurrent = current.index(of: new[index]) {
                    deleted.append(idxInCurrent)
                }
            }
        }
        let newSet = Set(new)
        let deletedSet = Set<Int>(deleted)
        for index in 0..<current.count {
            if !newSet.contains(current[index]) && !deletedSet.contains(index) {
                deleted.append(index)
            }
        }
        return (inserted.sorted(), deleted.sorted())
    }
}
