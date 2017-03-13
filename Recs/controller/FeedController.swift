//
//  FeedController.swift
//  Recs
//
//  Created by Christopher Paschal on 3/9/17.
//  Copyright © 2017 Christopher Paschal. All rights reserved.
//

import UIKit

class FeedController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // UI Components
    @IBOutlet weak var recsFeedList: UITableView!
    
    var recList = [Rec]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        recsFeedList.delegate = self
        recsFeedList.dataSource = self
        
        let rec = Rec()
        rec.userId = 12345
        rec.title = "This Book I Love"
        rec.category = "Book"
        recList.append(rec)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recList.count // your number of cell here
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        // create cell as custom template
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "recCell",
            for: indexPath) as! RecTableViewCell
        
        // create boilerplate size and shape
        cell.contentView.backgroundColor = UIColor.clear
        
        let whiteRoundedView : UIView = UIView(frame: CGRect(x: 10, y: 8, width: self.view.frame.size.width - 20, height: 120))
        
        whiteRoundedView.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [8.0, 135.0, 186.0, 0.0])
        whiteRoundedView.layer.masksToBounds = false
        whiteRoundedView.layer.cornerRadius = 10.0
        whiteRoundedView.layer.shadowOffset = CGSize(width: -1, height: 1)
        whiteRoundedView.layer.shadowOpacity = 0.2
        
        // color border according to rec category
        if recList[indexPath.row].category == "Book" {
            whiteRoundedView.layer.borderWidth = 3.0
            whiteRoundedView.layer.borderColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [255.0, 0.0, 0.0, 1.0])
        }
        
        // add to cell
        cell.contentView.addSubview(whiteRoundedView)
        //cell.contentView.sendSubview(toBack: whiteRoundedView)
        
        // add specific Rec data
        cell.recUserLabel.text = String(recList[indexPath.row].userId)
        cell.recTitleLabel.text = recList[indexPath.row].title
                
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell selected code here
    }


}

