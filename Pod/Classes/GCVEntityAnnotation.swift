//
//  GCVEntityAnnotation.swift
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

public struct GCVLocationInfo: Unboxable {
    public var latLng: GCVLatLng?

    public init(unboxer: Unboxer) {
        self.latLng = unboxer.unbox(key: "latLng")
    }
}

public struct GCVProperty: Unboxable {
    public var name: String?
    public var value: String?

    public init(unboxer: Unboxer) {
        self.name = unboxer.unbox(key: "name")
        self.value = unboxer.unbox(key: "value")
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
        self.mid = unboxer.unbox(key: "mid")
        self.locale = unboxer.unbox(key: "locale")
        self.description = unboxer.unbox(key: "description")
        self.score = unboxer.unbox(key: "score")
        self.confidence = unboxer.unbox(key: "confidence")
        self.topicality = unboxer.unbox(key: "topicality")
        self.locations = unboxer.unbox(key: "locations")
        self.properties = unboxer.unbox(key: "properties")
    }
}
