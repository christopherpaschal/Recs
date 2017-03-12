//
//  MyProfileController.swift
//  Recs
//
//  Created by Christopher Paschal on 3/9/17.
//  Copyright © 2017 Christopher Paschal. All rights reserved.
//

import UIKit

class MyProfileController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
    
    var recList = [Rec]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // populate user data from FB
        populateUserData()
       
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // your number of cell here
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // your cell coding
        let cell = UITableViewCell()
        cell.textLabel?.text = "text"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        // cell selected code here
    }
    
    
    func populateUserData() {

        self.profileNameLabel.text = LoggedInUser.name
        
        let url = NSURL(string: "https://graph.facebook.com/\(LoggedInUser.id)/picture?type=large&return_ssl_resources=1")
        self.profileImage.image = UIImage(data: NSData(contentsOf: url! as URL)! as Data)
        self.profileImage.layer.cornerRadius = 10.0
        self.profileImage.clipsToBounds = true

        
        self.profileRecsList.beginUpdates()
        self.profileRecsList.cellForRow(at: NSIndexPath(row: 1, section: 0) as IndexPath)
        self.profileRecsList.endUpdates()
    }


}

