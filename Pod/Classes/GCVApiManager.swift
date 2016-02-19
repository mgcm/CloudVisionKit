//
//  GCVApiManager.swift
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

import Foundation
import Alamofire
import Unbox

internal class GCVApiManager {

    private static let apiVersion = "v1"
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