//
//  CloudVision.swift
//  GCV
//
//  Created by Milton Moura on 27/12/15.
//  Copyright © 2015 mgcm. All rights reserved.
//


import Foundation
import SwiftyJSON
import Alamofire


enum GCVApiError : ErrorType {
    case RequestSizeExceeded
    case ImageDataSizeExceeded
    case ImagesPerRequestExceeded
}


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


public enum GCVFeatureDetectionType: String {
    case Face =     "FACE_DETECTION"
    case LandMark = "LANDMARK_DETECTION"
    case Logo =     "LOGO_DETECTION"
    case Label =    "LABEL_DETECTION"
    case Text =     "TEXT_DETECTION"
}


public struct GCVResponse {
    public var responses: [GCVAnnotateImageResponse]

    init(values: Array<AnyObject>) {
        self.responses = []

        for a: AnyObject in values {
            self.responses += [GCVAnnotateImageResponse(annotations: a)]
        }
    }
}


public struct GCVAnnotateImageResponse {
    //public var faceAnnotations:     [GCVFaceAnnotation]
    public var landmarkAnnotations: [GCVEntityAnnotation]
    public var logoAnnotations:     [GCVEntityAnnotation]
    public var labelAnnotations:    [GCVEntityAnnotation]
    public var textAnnotations:     [GCVEntityAnnotation]
    public var error:               GCVStatus

    init(annotations: AnyObject) {
        let annotDict = annotations as! Dictionary<String, AnyObject>

        self.landmarkAnnotations = []
        self.logoAnnotations = []
        self.labelAnnotations = []
        self.textAnnotations = []
        self.error = GCVStatus(code: 0, message: "")

        for key in annotDict.keys {
            switch (key) {
            case "labelAnnotations":
                let labels = annotDict["labelAnnotations"] as! Array<AnyObject>
                for label in labels {
                    let l = label as! Dictionary<String, AnyObject>
                    let entity = GCVEntityAnnotation(values: l)
                    self.labelAnnotations += [entity]
                }
            default:
                break
            }
        }
    }
}


public struct GCVEntityAnnotation {
    public var mid:             String
    public var locale:          String
    public var description:     String
    public var score:           Float
    public var confidence:      Float
    public var topicality:      Float

    init(values: Dictionary<String, AnyObject>) {
        self.mid = ""
        self.locale = ""
        self.description = ""
        self.score = 0
        self.confidence = 0
        self.topicality = 0

        if let mid = values["mid"] as? String {
            self.mid = mid
        }

        if let description = values["description"] as? String {
            self.description = description
        }

        if let score = values["score"] as? Float {
            self.score = score
        }
    }
}


public struct GCVStatus {
    public var code:    UInt
    public var message: String
}


final public class CloudVision {

    public init() {

    }

    public func annotateImage(request: GCVRequest, closure: (GCVResponse) -> Void) {
        let apiManager = GCVApiManager()
        
        do {
            let payload = try request.json()
            try apiManager.performRequest(payload, closure: { (response) -> Void in
                closure(response)
            })
        } catch GCVApiError.RequestSizeExceeded {
            NSLog("GCV Usage Limit Exceeded: Request Size > 8 MB")
        } catch GCVApiError.ImageDataSizeExceeded {
            NSLog("GCV Usage Limit Exceeded: Image size > 2 MB")
        } catch GCVApiError.ImagesPerRequestExceeded {
            NSLog("GCV Usage Limit Exceeded: Max Images Per Request > 16")
        } catch {
            NSLog("GCV Error: Request Failed")
        }
    }
}



