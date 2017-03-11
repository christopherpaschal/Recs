//
//  MyProfileController.swift
//  Recs
//
//  Created by Christopher Paschal on 3/9/17.
//  Copyright © 2017 Christopher Paschal. All rights reserved.
//

import UIKit

class MyProfileController: UIViewController {
    
    // UI Components
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileHandleLabel: UILabel!
    @IBOutlet weak var profileFollowersLabel: UILabel!
    @IBOutlet weak var profileFollowingLabel: UILabel!
    @IBOutlet weak var profileRecsList: UITableView!
    
    var id: String = ""
    var firstName: String = "firstname"
    var lastName: String = "lastname"
    var pictureURL: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //profileNameLabel.text = firstName + " " + lastName
        addUserData()
       
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addUserData() {

        self.profileNameLabel.text = LoggedInUser.name
        
        let url = NSURL(string: "https://graph.facebook.com/\(LoggedInUser.id)/picture?type=large&return_ssl_resources=1")
        self.profileImage.image = UIImage(data: NSData(contentsOf: url! as URL)! as Data)
//        if(FBSDKAccessToken.current() != nil) {
//            //print permissions, such as public_profile
//            //print(FBSDKAccessToken.current().permissions)
//            let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields" : "id, name, email"])
//            let connection = FBSDKGraphRequestConnection()
//            
//            connection.add(graphRequest, completionHandler: { (connection, result, error) -> Void in
//                
//                let data = result as! [String : AnyObject]
//                
//                self.profileNameLabel.text = data["name"] as? String
//                
//                let FBid = data["id"] as? String
//                
//                let url = NSURL(string: "https://graph.facebook.com/\(FBid!)/picture?type=large&return_ssl_resources=1")
//                self.profileImage.image = UIImage(data: NSData(contentsOf: url! as URL)! as Data)
//            })
//            connection.start()
//        }
    }


}

