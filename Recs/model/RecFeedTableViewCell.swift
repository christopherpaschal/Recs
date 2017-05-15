//
//  RecTableViewCell.swift
//  Recs
//
//  Created by Christopher Paschal on 5/14/17.
//  Copyright © 2017 Christopher Paschal. All rights reserved.
//

import UIKit

class RecFeedTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var recUserImage: UIImageView!
    @IBOutlet weak var recUserLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var recTitleLabel: UILabel!
    @IBOutlet weak var recContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
