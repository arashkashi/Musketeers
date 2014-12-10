//
//  RandUtil.swift
//  Musketeers
//
//  Created by mkec on 12/10/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import Foundation

class RandUtil
{
    class func randRange (lower: Int , upper: Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
}