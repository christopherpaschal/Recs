//
//  Util.swift
//  Recs
//
//  Created by Christopher Paschal on 3/10/17.
//  Copyright © 2017 Christopher Paschal. All rights reserved.
//

import Foundation
import AWSDynamoDB

class Util {
    
    var mapper: AWSDynamoDBObjectMapper;
    
    init() {
        let mapper = AWSDynamoDBObjectMapper.default()
    }
}

