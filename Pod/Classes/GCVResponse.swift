//
//  CloudVision.swift
//  GCV
//
//  Created by Milton Moura on 27/12/15.
//  Copyright © 2015 mgcm. All rights reserved.
//

import Unbox

public struct GCVResponse: Unboxable {
    public var responses:   [GCVAnnotateImageResponse]?
    public var error:       GCVStatus?

    public init(unboxer: Unboxer) {
        self.responses = unboxer.unbox("responses")
        self.error = unboxer.unbox("error")
    }
}