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
        
        let rec1 = Rec()
        rec1.userId = 12345
        rec1.title = "this book I love"
        rec1.category = "Book"
        recList.append(rec1)
        
        let rec2 = Rec()
        rec2.userId = 12345
        rec2.title = "this movie I love"
        rec2.category = "Movie"
        recList.append(rec2)
        
        let rec3 = Rec()
        rec3.userId = 12345
        rec3.title = "this tv show I love"
        rec3.category = "TV Show"
        recList.append(rec3)
        
        let rec4 = Rec()
        rec4.userId = 12345
        rec4.title = "this restaurant I love"
        rec4.category = "Restaurant"
        recList.append(rec4)
        
        let rec5 = Rec()
        rec5.userId = 12345
        rec5.title = "this artist I love"
        rec5.category = "Artist"
        recList.append(rec5)
        
        let rec6 = Rec()
        rec6.userId = 12345
        rec6.title = "this thing I love"
        rec6.category = "Other"
        recList.append(rec6)
        
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
            whiteRoundedView.layer.borderColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [241.0, 131.0, 149.0, 1.0])
        }
        
        if recList[indexPath.row].category == "Movie" {
            whiteRoundedView.layer.borderColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [255.0, 217.0, 139.0, 1.0])
            print(recList[indexPath.row].category)
        }
        if recList[indexPath.row].category == "TV Show" {
            whiteRoundedView.layer.borderColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [255.0, 186.0, 139.0, 1.0])
        }
        if recList[indexPath.row].category == "Artist" {
            whiteRoundedView.layer.borderColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [126.0, 114.0, 189.0, 1.0])
        }
        if recList[indexPath.row].category == "Restaurant" {
            whiteRoundedView.layer.borderColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [146.0, 218.0, 119.0, 1.0])
        }
//        if recList[indexPath.row].category == "Other" {
//            whiteRoundedView.layer.borderColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [234.0, 245.0, 251.0, 1.0])
//        }
        
        whiteRoundedView.layer.borderWidth = 3.0
        
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

