//
//  WriteRecController.swift
//  Recs
//
//  Created by Christopher Paschal on 3/9/17.
//  Copyright © 2017 Christopher Paschal. All rights reserved.
//

import UIKit

class WriteRecController: UIViewController {
    
    //UI Components
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var recTitleField: UITextField!
    @IBOutlet weak var recReasonField: UITextView!
    @IBOutlet weak var saveRecButton: UIButton!
    @IBOutlet weak var cancelRecButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    
    
    
    
}

