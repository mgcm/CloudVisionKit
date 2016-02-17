//
//  GCVFeature.swift
//  CloudVisionKit
//
//  Created by Milton Moura on 27/12/15.
//  Copyright © 2015 mgcm. All rights reserved.
//

import SwiftyJSON

public enum GCVFeatureDetectionType: String {
    case Face =     "FACE_DETECTION"
    case LandMark = "LANDMARK_DETECTION"
    case Logo =     "LOGO_DETECTION"
    case Label =    "LABEL_DETECTION"
    case Text =     "TEXT_DETECTION"
}


public struct GCVFeature {
    public var type:        GCVFeatureDetectionType
    public var maxResults:  UInt

    public init(type: GCVFeatureDetectionType, maxResults: UInt) {
        self.type = type
        self.maxResults = maxResults
    }

    public func json() -> JSON {
        return JSON(["type": type.rawValue, "maxResults": String(maxResults)])
    }
}