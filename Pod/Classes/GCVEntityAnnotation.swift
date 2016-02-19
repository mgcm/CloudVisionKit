//
//  GCVEntityAnnotation.swift
//  CloudVisionKit
//
//  Created by Milton Moura on 27/12/15.
//  Copyright © 2015 mgcm. All rights reserved.
//

import Unbox

public struct GCVLocationInfo: Unboxable {
    public var latLng: GCVLatLng?

    public init(unboxer: Unboxer) {
        self.latLng = unboxer.unbox("latLng")
    }
}

public struct GCVProperty: Unboxable {
    public var name: String?
    public var value: String?

    public init(unboxer: Unboxer) {
        self.name = unboxer.unbox("name")
        self.value = unboxer.unbox("value")
    }
}

public struct GCVEntityAnnotation: Unboxable {
    public var mid:             String?
    public var locale:          String?
    public var description:     String?
    public var score:           Float?
    public var confidence:      Float?
    public var topicality:      Float?
    public var boundingPoly:    GCVBoundingPoly?
    public var locations:       [GCVLocationInfo]?
    public var properties:      [GCVProperty]?

    public init(unboxer: Unboxer) {
        self.mid = unboxer.unbox("mid")
        self.locale = unboxer.unbox("locale")
        self.description = unboxer.unbox("description")
        self.score = unboxer.unbox("score")
        self.confidence = unboxer.unbox("confidence")
        self.topicality = unboxer.unbox("topicality")
        self.locations = unboxer.unbox("locations")
        self.properties = unboxer.unbox("properties")
    }
}