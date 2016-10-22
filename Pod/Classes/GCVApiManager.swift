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

    fileprivate static let apiVersion = "v1"
    fileprivate static let baseURL = "https://vision.googleapis.com/" + GCVApiManager.apiVersion + "/images:annotate"
    fileprivate var apiKey: String?

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    fileprivate func buildQueryURL() -> URL? {
        if var components = URLComponents(string: GCVApiManager.baseURL) {
            components.queryItems = [URLQueryItem(name: "key", value: self.apiKey)]
            return components.url
        }
        return nil
    }

    fileprivate func requestHeaders() -> [String: String] {
        return ["Content-Type": "application/json"];
    }

    internal func performRequest(_ payload: [String: AnyObject]?, closure: @escaping (GCVResponse) -> Void) throws -> Void {
        let request = Alamofire.request(self.buildQueryURL()!, method: .post, parameters: payload, encoding: JSONEncoding.default)

        if let urlRequest = request.request {
            if let httpBody = urlRequest.httpBody {
                if httpBody.count > 8000000 {
                    throw GCVApiError.requestSizeExceeded
                }
            }
        }

        request.responseJSON { (response) -> Void in
            if let JSON = response.result.value {
                let resp = JSON as! Dictionary<String, AnyObject>
                let r: GCVResponse = try! unbox(dictionary: resp)
                closure(r)
            }
        }
    }
}
