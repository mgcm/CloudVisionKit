//
//  GCVLandmark.swift
//  CloudVisionKit
//
//  Created by Milton Moura on 17/02/16.
//
//

import Unbox

public struct GCVPosition: Unboxable {
    public var x: Float?
    public var y: Float?
    public var z: Float?

    public init(unboxer: Unboxer) {
        self.x = unboxer.unbox("x")
        self.y = unboxer.unbox("y")
        self.z = unboxer.unbox("z")
    }
}


public struct GCVLandmark: Unboxable {
    public var type: String?
    public var position: GCVPosition?

    public init(unboxer: Unboxer) {
        self.type = unboxer.unbox("type")
        self.position = unboxer.unbox("position")
    }
}