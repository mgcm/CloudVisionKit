//
//  GCVApiManager.swift
//  GCV
//
//  Created by Milton Moura on 27/12/15.
//  Copyright © 2015 mgcm. All rights reserved.
//

import Foundation
import Alamofire
import Unbox

internal class GCVApiManager {

    private static let apiVersion = "v1alpha1"
    private static let baseURL = "https://vision.googleapis.com/" + GCVApiManager.apiVersion + "/images:annotate"
    private var apiKey: String?

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    private func buildQueryURL() -> NSURL? {
        if let components = NSURLComponents(string: GCVApiManager.baseURL) {
            components.queryItems = [NSURLQueryItem(name: "key", value: self.apiKey)]
            return components.URL
        }
        return nil
    }

    private func requestHeaders() -> [String: String] {
        return ["Content-Type": "application/json"];
    }

    internal func performRequest(payload: [String: AnyObject]?, closure: (GCVResponse) -> Void) throws -> Void {
        let request = Alamofire.request(.POST, self.buildQueryURL()!, parameters: payload, encoding: .JSON, headers: self.requestHeaders())

        if let
            urlRequest = request.request,
            httpBody = urlRequest.HTTPBody {
                if httpBody.length > 8000000 {
                    throw GCVApiError.RequestSizeExceeded
                }
        }

        request.responseJSON { (response) -> Void in
            if let JSON = response.result.value {
                let resp = JSON as! Dictionary<String, AnyObject>
                let r: GCVResponse = Unbox(resp)!
                closure(r)
            }
        }
    }
}