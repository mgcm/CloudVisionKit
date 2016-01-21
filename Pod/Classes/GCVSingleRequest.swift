//
//  CloudVision.swift
//  GCV
//
//  Created by Milton Moura on 27/12/15.
//  Copyright © 2015 mgcm. All rights reserved.
//

import SwiftyJSON

public struct GCVSingleRequest {
    public var image:       NSData
    public var features:    [GCVFeature]

    public init(image: NSData, features: [GCVFeature]) {
        self.image = image
        self.features = features
    }

    public func json() throws -> JSON {
        var allFeatures = [JSON]()
        for f in features {
            allFeatures += [f.json()]
        }

        if image.length > 2000000 {
            throw GCVApiError.ImageDataSizeExceeded
        }

        let dict: [String: JSON] = ["image": JSON(["content": image.base64EncodedStringWithOptions(
            [
                NSDataBase64EncodingOptions.EncodingEndLineWithCarriageReturn,
                NSDataBase64EncodingOptions.Encoding64CharacterLineLength
            ])
            ]), "features": JSON(allFeatures)]
        return JSON(dict)
    }
}