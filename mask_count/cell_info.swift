//
//  cell_info.swift
//  mask_count
//
//  Created by maya on 2021/03/19.
//

import Foundation

class cell_info: NSObject {
    
    var maskName: String
    var maskCount: Int
    
    init(name:String, count: Int) {
        
        self.maskName = name
        self.maskCount = count
    }
}
