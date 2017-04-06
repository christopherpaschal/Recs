//
//  LoginController.swift
//  Recs
//
//  Created by Christopher Paschal on 3/10/17.
//  Copyright © 2017 Christopher Paschal. All rights reserved.
//

import Foundation
import UIKit

class LoginController: UIViewController, FBSDKLoginButtonDelegate {
    /**
     Sent to the delegate when the button was used to login.
     - Parameter loginButton: the sender
     - Parameter result: The results of the login
     - Parameter error: The error (if any) from the login
     */
    

    
    // UI Components
    @IBOutlet weak var loginLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (FBSDKAccessToken.current() != nil)
        {
            // User is already logged in, do work such as go to next view controller.
            print("Already logged in, re=saving FB token\n\n")
            //let ref = UserDefaults.standard
            //ref.set(FBSDKAccessToken.current().tokenString, forKey: "fb_token")
            self.performSegue(withIdentifier: "loginSegue", sender: self)
        }
        else
        {
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            self.view.addSubview(loginView)
            loginView.center = self.view.center
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // Facebook Methods
    
    public func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("User Logged In")
        self.performSegue(withIdentifier: "loginSegue", sender: nil)
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
            //let ref = UserDefaults.standard
            //ref.set(FBSDKAccessToken.current().tokenString, forKey: "fb_token")
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
    }
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }

    
}
