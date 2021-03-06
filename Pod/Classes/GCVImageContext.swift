//
//  GCVImageContext.swift
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

import Unbox

public struct GCVLatLongRect: Unboxable
{
    public var minLatLng: GCVLatLng
    public var maxLatLng: GCVLatLng

    public init(unboxer: Unboxer) {
        self.minLatLng = try! unboxer.unbox(key: "minLatLng")
        self.maxLatLng = try! unboxer.unbox(key: "maxLatLng")
    }
}

public struct ImageContext: Unboxable
{
    public var latLongRect: GCVLatLongRect?
    public var languageHints: [String]?

    public init(unboxer: Unboxer) {
        self.latLongRect = unboxer.unbox(key: "latLongRect")
        self.languageHints = unboxer.unbox(key: "languageHints")
    }
}
