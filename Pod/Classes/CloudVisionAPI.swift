//
//  CloudVisionAPI.swift
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
import SwiftyJSON
import Alamofire
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


final public class CloudVision {

    fileprivate var apiKey: String?

    public init(apiKey: String) {
        self.apiKey = apiKey
    }

    public func annotateImage(_ request: GCVRequest, closure: @escaping (GCVResponse) -> Void) {
        let apiManager = GCVApiManager(apiKey: self.apiKey!)
        
        do {
            let payload = try request.json()
            try apiManager.performRequest(payload, closure: { (response) -> Void in
                if response.error?.code > 0 {
                    NSLog("GCV Error: \(response.error!.message)")
                }
                closure(response)
            })
        } catch GCVApiError.requestSizeExceeded {
            NSLog("GCV Usage Limit Exceeded: Request Size > 8 MB")
        } catch GCVApiError.imageDataSizeExceeded {
            NSLog("GCV Usage Limit Exceeded: Image size > 2 MB")
        } catch GCVApiError.imagesPerRequestExceeded {
            NSLog("GCV Usage Limit Exceeded: Max Images Per Request > 16")
        } catch {
            NSLog("GCV Error: Request Failed")
        }
    }
}



