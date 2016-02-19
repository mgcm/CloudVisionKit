//
//  GCVLatLng.swift
//  CLoudVisionKit
//
//  Created by Milton Moura on 19/02/16.
//
//

import Unbox

public struct GCVLatLng: Unboxable
{
    public var latitude: Float
    public var longitude: Float

    public init(unboxer: Unboxer) {
        self.latitude = unboxer.unbox("latitude")
        self.longitude = unboxer.unbox("longitude")
    }
}