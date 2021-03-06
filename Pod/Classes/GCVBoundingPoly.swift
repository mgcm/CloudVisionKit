//
//  GCVBoundingPoly.swift
//  CloudVisionKit
//
//  Copyright (c) 2016 Milton Moura <miltonmoura@gmail.com>
//
//  The MIT License (MIT)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Unbox
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


public struct GCVVertex: Unboxable {
    public var x: Float?
    public var y: Float?

    public init(unboxer: Unboxer) {
        self.x = unboxer.unbox(key: "x")
        self.y = unboxer.unbox(key: "y")
    }
}


public struct GCVBoundingPoly: Unboxable {
    public var vertices: [GCVVertex]?

    public init(unboxer: Unboxer) {
        self.vertices = unboxer.unbox(key: "vertices")
    }
}

extension GCVBoundingPoly: CustomStringConvertible {
    public var description: String {
        var string = "\n"
        guard vertices?.count > 0 else {
            return "GVCBoundingPoly is empty"
        }
        
        for v in vertices! {
            string += "(\(v.x!), \(v.y!))\n"
        }
        return string
    }
}
