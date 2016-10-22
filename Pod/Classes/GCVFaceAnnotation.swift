//
//  GCVFaceAnnotation.swift
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
        self.boundingPoly = unboxer.unbox(key: "boundingPoly")
        self.fdBoundingPoly = unboxer.unbox(key: "fdBoundingPoly")
        self.landmarks = unboxer.unbox(key: "landmarks")
        self.rollAngle = unboxer.unbox(key: "rollAngle")
        self.panAngle = unboxer.unbox(key: "panAngle")
        self.tiltAngle = unboxer.unbox(key: "tiltAngle")
        self.detectionConfidence = unboxer.unbox(key: "detectionConfidence")
        self.landmarkingConfidence = unboxer.unbox(key: "landmarkingConfidence")
        self.joyLikelihood = unboxer.unbox(key: "joyLikelihood")
        self.sorrowLikelihood = unboxer.unbox(key: "sorrowLikelihood")
        self.angerLikelihood = unboxer.unbox(key: "angerLikelihood")
        self.surpriseLikelihood = unboxer.unbox(key: "surpriseLikelihood")
        self.underExposedLikelihood = unboxer.unbox(key: "underExposedLikelihood")
        self.blurredLikelihood = unboxer.unbox(key: "blurredLikelihood")
        self.headwearLikelihood = unboxer.unbox(key: "headwearLikelihood")
    }
}
