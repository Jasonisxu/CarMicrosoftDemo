//
//  UploadImageModel.swift
//  YiDao
//
//  Created by Wicrenet_Jason on 2017/11/14.
//  Copyright © 2017年 Wicrenet_Jason. All rights reserved.
//

import Foundation

class UploadImageModel: HandyJSON {
    
    var code: Int = 0

    var result: ResultUploadImageModel?

    required init() {}
    
    
}

class ResultUploadImageModel: HandyJSON {
    
    var value: [String]?
    
    required init() {}
    
    
}
