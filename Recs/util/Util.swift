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
    
    let mapper: AWSDynamoDBObjectMapper = AWSDynamoDBObjectMapper.default()
    
    func saveRec(rec: Rec) -> Int {
        mapper.save(rec).continueOnSuccessWith(block: { (task:AWSTask<AnyObject>!) -> Any? in
            if let error = task.error as NSError? {
                print("The request failed. Error: \(error)")
                return 1
            } else {
                // Do something with task.result or perform other operations.
                return 0
            }
        })
        return 0
    }

}

