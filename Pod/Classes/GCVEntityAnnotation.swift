//
//  CloudVision.swift
//  GCV
//
//  Created by Milton Moura on 27/12/15.
//  Copyright © 2015 mgcm. All rights reserved.
//

import Unbox

public struct GCVEntityAnnotation: Unboxable {
    public var mid:             String?
    public var locale:          String?
    public var description:     String?
    public var score:           Float?
    public var confidence:      Float?
    public var topicality:      Float?

    public init(unboxer: Unboxer) {
        self.mid = unboxer.unbox("mid")
        self.locale = unboxer.unbox("locale")
        self.description = unboxer.unbox("description")
        self.score = unboxer.unbox("score")
        self.confidence = unboxer.unbox("confidence")
        self.topicality = unboxer.unbox("topicality")
    }
}