//
//  MyProfileController.swift
//  Recs
//
//  Created by Christopher Paschal on 3/9/17.
//  Copyright © 2017 Christopher Paschal. All rights reserved.
//

import UIKit
import AWSDynamoDB

class MyProfileController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // UI Components
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileHandleLabel: UILabel!
    @IBOutlet weak var profileFollowersLabel: UILabel!
    @IBOutlet weak var profileFollowingLabel: UILabel!
    @IBOutlet weak var profileRecsList: UITableView!
    
    let mapper: AWSDynamoDBObjectMapper = AWSDynamoDBObjectMapper.default()
    
    @IBOutlet weak var profileRecListHeightConstraint: NSLayoutConstraint!
    
    var id: String = ""
    var firstName: String = "firstname"
    var lastName: String = "lastname"
    var pictureURL: String = ""
    
    var recList = [Rec]()
    
    var dbUtil = Util()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        profileRecsList.dataSource = self
        profileRecsList.delegate = self
        
        let myRec = Rec()
        myRec?.title = "Static Rec!"
        myRec?.userId = "12345"
        myRec?.category = "Book"
        myRec?.date = "today"
        
        //let code = dbUtil.saveRec(rec: myRec!)
        
        getRecsForUser(userId: LoggedInUser.id)
        
        
        // populate user data from FB
        populateUserData()
       
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
        
        // remove old content view
        cell.contentView.viewWithTag(1)?.removeFromSuperview()
        
        
        let recView : UIView = UIView(frame: CGRect(x: 0, y: 45, width: self.view.frame.size.width, height: 300))
        
        recView.backgroundColor = UIColor.lightGray
        
        // set a tag so view can be removed later when reusing cell
        recView.tag = 1
        
        // add to cell
        cell.contentView.addSubview(recView)
        cell.contentView.sendSubview(toBack: recView)
        
        // add specific Rec data
        //cell.recUserLabel.text = String(recList[indexPath.row].userId)
        // TODO make dynamic
        cell.recUserLabel.text = "Christopher Paschal"

        cell.recTitleLabel.text = recList[indexPath.row].title
        
        // color label according to rec category
        if recList[indexPath.row].category == "Book" {
            let color: UIColor = UIColor(red: CGFloat(241.0/255.0), green: CGFloat(131.0/255.0), blue: CGFloat(149.0/255.0), alpha: 1.0)
            cell.recTitleLabel.textColor = color
            cell.categoryLabel.textColor = color
            cell.categoryLabel.text = "Book"
            
        } else if recList[indexPath.row].category == "Movie" {
            let color: UIColor = UIColor(red: CGFloat(139.0/255.0), green: CGFloat(255.0/255.0), blue: CGFloat(139.0/255.0), alpha: 1.0)
            cell.recTitleLabel.textColor = color
            cell.categoryLabel.textColor = color
            cell.categoryLabel.text = "Movie"
            
        } else if recList[indexPath.row].category == "TV Show" {
            let color: UIColor = UIColor(red: CGFloat(255.0/255.0), green: CGFloat(186.0/255.0), blue: CGFloat(139.0/255.0), alpha: 1.0)
            cell.recTitleLabel.textColor = color
            cell.categoryLabel.textColor = color
            cell.categoryLabel.text = "TV Show"
            
        } else if recList[indexPath.row].category == "Artist" {
            let color: UIColor = UIColor(red: CGFloat(126.0/255.0), green: CGFloat(114.0/255.0), blue: CGFloat(189.0/255.0), alpha: 1.0)
            cell.recTitleLabel.textColor = color
            cell.categoryLabel.textColor = color
            cell.categoryLabel.text = "Artist"
            
            
        } else if recList[indexPath.row].category == "Restaurant" {
            let color: UIColor = UIColor(red: CGFloat(119.0/255.0), green: CGFloat(146.0/255.0), blue: CGFloat(218.0/255.0), alpha: 1.0)
            cell.recTitleLabel.textColor = color
            cell.categoryLabel.textColor = color
            cell.categoryLabel.text = "Restaurant"
            
        } else {
            let color: UIColor = UIColor(red: CGFloat(234.0/255.0), green: CGFloat(245.0/255.0), blue: CGFloat(251.0/255.0), alpha: 1.0)
            cell.recTitleLabel.textColor = color
            cell.categoryLabel.textColor = color
            cell.categoryLabel.text = "Other"
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell selected code here
    }
    
    
    func populateUserData() {
        
        self.profileNameLabel.text = LoggedInUser.name
        
        let url = NSURL(string: "https://graph.facebook.com/\(LoggedInUser.id)/picture?type=large&return_ssl_resources=1")
        self.profileImage.image = UIImage(data: NSData(contentsOf: url! as URL)! as Data)
        self.profileImage.layer.cornerRadius = 10.0
        self.profileImage.clipsToBounds = true

    }
    
    func populateUserRecs() {
        
        //use user id to get all recs under that id in AWS DB
        
        //put recs into array
        
        
    }
    
    func getRecsForUser(userId: String) {
        
        let scanExpression = AWSDynamoDBScanExpression()
        scanExpression.limit = 50
        scanExpression.filterExpression = "userId = :val"
        scanExpression.expressionAttributeValues = [":val": userId]
        
        mapper.scan(Rec.self, expression: scanExpression).continueOnSuccessWith(block: { (task:AWSTask<AWSDynamoDBPaginatedOutput>!) -> Any? in
            if let error = task.error as NSError? {
                print("The request failed. Error: \(error)")
            } else if let paginatedOutput = task.result {
                for rec in paginatedOutput.items as! [Rec] {
                    // Do something with rec.
                    print(rec.title ?? "no title")
                    self.recList.append(rec)
                }
                DispatchQueue.main.async{
                    self.profileRecsList.reloadData()
                }
            }
            return task
        })
        
    }


}

