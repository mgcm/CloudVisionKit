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

final public class CloudVision {

    private var apiKey: String?

    public init(apiKey: String) {
        self.apiKey = apiKey
    }

    public func annotateImage(request: GCVRequest, closure: (GCVResponse) -> Void) {
        let apiManager = GCVApiManager(apiKey: self.apiKey!)
        
        do {
            let payload = try request.json()
            try apiManager.performRequest(payload, closure: { (response) -> Void in
                if response.error?.code > 0 {
                    NSLog("GCV Error: \(response.error!.message)")
                }
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



