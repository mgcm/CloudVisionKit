//
//  GCVSafeSearchAnnotation.swift
//  CloudVisionKit
//
//  Created by Milton Moura on 19/02/16.
//
//

import Unbox

public struct GCVSafeSearchAnnotation: Unboxable {
    public var adult: String?
    public var spoof: String?
    public var medical: String?
    public var violence: String?

    public init(unboxer: Unboxer) {
        self.adult = unboxer.unbox("adult")
        self.spoof = unboxer.unbox("spoof")
        self.medical = unboxer.unbox("medical")
        self.violence = unboxer.unbox("violence")
    }
}