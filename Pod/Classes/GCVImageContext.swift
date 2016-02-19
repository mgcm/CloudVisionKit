//
//  GCVImageContext.swift
//  CloudVisionKit
//
//  Created by Milton Moura on 19/02/16.
//
//

import Unbox

public struct GCVLatLongRect: Unboxable
{
    public var minLatLng: GCVLatLng
    public var maxLatLng: GCVLatLng

    public init(unboxer: Unboxer) {
        self.minLatLng = unboxer.unbox("minLatLng")
        self.maxLatLng = unboxer.unbox("maxLatLng")
    }
}

public struct ImageContext: Unboxable
{
    public var latLongRect: GCVLatLongRect?
    public var languageHints: [String]?

    public init(unboxer: Unboxer) {
        self.latLongRect = unboxer.unbox("latLongRect")
        self.languageHints = unboxer.unbox("languageHints")
    }
}