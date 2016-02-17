//
//  GCVAnnotateImageResponse.swift
//  CloudVisionKit
//
//  Created by Milton Moura on 27/12/15.
//  Copyright © 2015 mgcm. All rights reserved.
//

import Unbox

public struct GCVAnnotateImageResponse: Unboxable {
    public var faceAnnotations:     [GCVFaceAnnotation]?
    public var landmarkAnnotations: [GCVEntityAnnotation]?
    public var logoAnnotations:     [GCVEntityAnnotation]?
    public var labelAnnotations:    [GCVEntityAnnotation]?
    public var textAnnotations:     [GCVEntityAnnotation]?

    public init(unboxer: Unboxer) {
        self.faceAnnotations = unboxer.unbox("faceAnnotations")
        self.landmarkAnnotations = unboxer.unbox("landmarkAnnotations")
        self.logoAnnotations = unboxer.unbox("logoAnnotations")
        self.labelAnnotations = unboxer.unbox("labelAnnotations")
        self.textAnnotations = unboxer.unbox("textAnnotations")
    }
}