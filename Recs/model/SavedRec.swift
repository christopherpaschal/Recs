//
//  SavedRec.swift
//  Recs
//
//  Created by Christopher Paschal on 3/10/17.
//  Copyright © 2017 Christopher Paschal. All rights reserved.
//

import Foundation

class SavedRec {
    
    var category: String = ""
    var title: String = ""
    var reason: String = ""
    var date: Date = Date()
    var userId: Int = 0
    var recId: Int = 0
    
    init() {
        
    }
    
    init(rec: Rec) {
        category = rec.category
        title = rec.title
        reason = rec.reason
        date = rec.date
        userId = rec.userId
        recId = rec.recId
    }
    
}
