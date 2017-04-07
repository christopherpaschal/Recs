//
//  WriteRecController.swift
//  Recs
//
//  Created by Christopher Paschal on 3/9/17.
//  Copyright © 2017 Christopher Paschal. All rights reserved.
//

import UIKit

class WriteRecController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    //UI Components
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var recTitleField: UITextField!
    @IBOutlet weak var recReasonField: UITextView!

    
    let categories = ["Book", "Movie", "TV Show", "Artist", "Restaurant", "Other"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        
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
        
    }
    
    
    
    
}

