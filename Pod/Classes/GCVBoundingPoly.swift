//
//  GCVBoundingPoly.swift
//  CloudVisionKit
//
//  Created by Milton Moura on 17/02/16.
//
//

import Unbox

public struct GCVVertex: Unboxable {
    public var x: Float?
    public var y: Float?

    public init(unboxer: Unboxer) {
        self.x = unboxer.unbox("x")
        self.y = unboxer.unbox("y")
    }
}


public struct GCVBoundingPoly: Unboxable {
    public var vertices: [GCVVertex]?

    public init(unboxer: Unboxer) {
        self.vertices = unboxer.unbox("vertices")
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