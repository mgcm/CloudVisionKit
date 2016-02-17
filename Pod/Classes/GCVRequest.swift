//
//  GCVRequest.swift
//  CloudVisionKit
//
//  Created by Milton Moura on 27/12/15.
//  Copyright © 2015 mgcm. All rights reserved.
//

import SwiftyJSON

public struct GCVRequest {
    public var requests: [GCVSingleRequest]

    public init(requests: [GCVSingleRequest]) {
        self.requests = requests
    }

    public func json() throws -> [String: AnyObject]? {
        var allRequests = [JSON]()
        var imageCount = 0

        for r in requests {
            try allRequests += [r.json()]
            imageCount += 1
        }

        guard imageCount <= 16 else {
            throw GCVApiError.ImagesPerRequestExceeded
        }

        return ["requests": JSON(allRequests).rawValue]
    }
}
