//
//  GCVFaceAnnotation.swift
//  CloudVisionKit
//
//  Created by Milton Moura on 17/02/16.
//
//

import Unbox

public struct GCVFaceAnnotation: Unboxable {
    public var boundingPoly: GCVBoundingPoly?
    public var fdBoundingPoly: GCVBoundingPoly?
    public var landmarks: [GCVLandmark]?
    public var rollAngle: Float?
    public var panAngle: Float?
    public var tiltAngle: Float?
    public var detectionConfidence: Float?
    public var landmarkingConfidence: Float?
    public var joyLikelihood: String?
    public var sorrowLikelihood: String?
    public var angerLikelihood: String?
    public var surpriseLikelihood: String?
    public var underExposedLikelihood: String?
    public var blurredLikelihood: String?
    public var headwearLikelihood: String?

    public init(unboxer: Unboxer) {
        self.boundingPoly = unboxer.unbox("boundingPoly")
        self.fdBoundingPoly = unboxer.unbox("fdBoundingPoly")
        self.landmarks = unboxer.unbox("landmarks")
        self.rollAngle = unboxer.unbox("rollAngle")
        self.panAngle = unboxer.unbox("panAngle")
        self.tiltAngle = unboxer.unbox("tiltAngle")
        self.detectionConfidence = unboxer.unbox("detectionConfidence")
        self.landmarkingConfidence = unboxer.unbox("landmarkingConfidence")
        self.joyLikelihood = unboxer.unbox("joyLikelihood")
        self.sorrowLikelihood = unboxer.unbox("sorrowLikelihood")
        self.angerLikelihood = unboxer.unbox("angerLikelihood")
        self.surpriseLikelihood = unboxer.unbox("surpriseLikelihood")
        self.underExposedLikelihood = unboxer.unbox("underExposedLikelihood")
        self.blurredLikelihood = unboxer.unbox("blurredLikelihood")
        self.headwearLikelihood = unboxer.unbox("headwearLikelihood")
    }
}