//
//  GCVStatus.swift
//  CloudVisionKit
//
//  Created by Milton Moura on 27/12/15.
//  Copyright © 2015 mgcm. All rights reserved.
//

import Unbox

public struct GCVStatus: Unboxable {
    public var code:    Int
    public var message: String
    public var status:  String

    public init(unboxer: Unboxer) {
        self.message = unboxer.unbox("message")
        self.status = unboxer.unbox("status")
        self.code = unboxer.unbox("code")
    }
}