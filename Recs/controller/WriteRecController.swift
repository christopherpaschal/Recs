//
//  WriteRecController.swift
//  Recs
//
//  Created by Christopher Paschal on 3/9/17.
//  Copyright © 2017 Christopher Paschal. All rights reserved.
//

import UIKit
import AWSDynamoDB

class WriteRecController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    //UI Components
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var recTitleField: UITextField!
    @IBOutlet weak var publishButton: UIButton!
    
    var category: String = ""
    
    let mapper: AWSDynamoDBObjectMapper = AWSDynamoDBObjectMapper.default()

    
    let categories = ["Book", "Movie", "TV Show", "Artist", "Restaurant", "Other"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        publishButton.addTarget(self, action: #selector(WriteRecController.publishButtonPressed(sender:)) , for: .touchUpInside)

        // set default to be the first picker option
        category = categories[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cancelWriteRecSegue" {
            let nextView = segue.destination as! UITabBarController
            nextView.selectedIndex = 1
        }
        
        if segue.identifier == "recPublishedSegue" {
            let nextView = segue.destination as! UITabBarController
            nextView.selectedIndex = 1
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        category = categories[row]
    }
    
    func publishButtonPressed(sender: UIButton!) {
        
        let uuid = UUID().uuidString
        
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd MM yyyy"
        
        print("\n\n\nWRITING REC")
        let newRec:Rec = Rec()
        newRec.recId = uuid
        newRec.category = category
        newRec.title = recTitleField.text
        newRec.userId = LoggedInUser.id
        newRec.date = formatter.string(from: date)
        
        mapper.save(newRec).continueWith(block: { (task:AWSTask<AnyObject>!) -> Any? in
            if let error = task.error as NSError? {
                print("The request failed. Error: \(error)")
            } else {
                // Do something with task.result or perform other operations.
                print("SAVE SUCCESSFUL\n\n")
            }
            
            return task
        })
        
        self.performSegue(withIdentifier: "recPublishedSegue", sender: self)
        
    }
    
    
    
    
}

