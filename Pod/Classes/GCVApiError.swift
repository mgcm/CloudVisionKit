//
//  GCVApiError.swift
//  CloudVisionKit
//
//  Created by Milton Moura on 27/12/15.
//  Copyright © 2015 mgcm. All rights reserved.
//

public enum GCVApiError : ErrorType {
    case InvalidCredentials
    case RequestSizeExceeded
    case ImageDataSizeExceeded
    case ImagesPerRequestExceeded
}