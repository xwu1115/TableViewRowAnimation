//
//  ComputeDifferenceTest.swift
//  TableAnimationExampleTests
//
//  Created by Shawn Wu on 8/30/19.
//  Copyright © 2019 Shawn Wu. All rights reserved.
//

import XCTest

class ComputeDifferenceTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test() {
        for _ in 0..<100 {
            let existingLen = arc4random_uniform(100)
            let newLen = arc4random_uniform(100)
            var new = [Int]()
            var existing = [Int]()
            while existing.count < existingLen {
                let num = Int(arc4random_uniform(100))
                if !existing.contains(num) {
                    existing.append(num)
                }
            }
            
            while new.count < newLen {
                let num = Int(arc4random_uniform(100))
                if !new.contains(num) {
                    new.append(num)
                }
            }
            
            let result = Array.computeDifference(current: existing, new: new)
            var arr = [Int]()
            for i in 0..<existing.count {
                if result.1.contains(i) {
                    continue
                }
                arr.append(existing[i])
            }
            for i in 0..<result.0.count {
                arr.insert(new[result.0[i]], at: result.0[i])
            }
            XCTAssertEqual(new, arr)
        }
    }
}
