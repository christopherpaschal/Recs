//
//  Rec.swift
//  Recs
//
//  Created by Christopher Paschal on 3/10/17.
//  Copyright © 2017 Christopher Paschal. All rights reserved.
//

import Foundation
import AWSDynamoDB

class Rec : AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    var category: String? = ""
    var title: String? = ""
    var date: String? = ""
    var userId: String? = ""
    
    class func dynamoDBTableName() -> String {
        return "Recs"
    }
    
    class func hashKeyAttribute() -> String {
        return "userId"
    }
}
