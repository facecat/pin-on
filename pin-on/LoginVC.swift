//
//  LoginVC.swift
//  pin-on
//
//  Created by 邱国邦 on 16/1/21.
//  Copyright © 2016年 FaceCat. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(animated: Bool) {
        if NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) != nil {
            performSegueWithIdentifier(SEGUE_LOGIN, sender: nil)
        }
    }

    //Facebook Login
    @IBAction func facebookLoginBtnPressed(sender: UIButton!) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["email"]) { facebookResult, facebookError in
            
            if facebookError != nil {
                print("Facebook login error\(facebookError)")
            } else {
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                print("Success login with \(accessToken)")

                //Talk to firebase
                DataService.sharedDataSvc.REF_BASE.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { error, authData in

                    if error != nil {
                        print("Facebook login failed\(error)")
                        self.showErrorAlart("Facebook login failed", msg: "Please check your Facebook count")
                    }
                    
                    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: KEY_UID)
                    self.performSegueWithIdentifier(SEGUE_LOGIN, sender: nil)
                })
            }
            
        }
    }
    
    //Email Login
    @IBAction func attemptLogin(sender: UIButton!) {
        if let email = emailTextField.text where email != "", let psw = passwordTextField.text where psw != "" {
           
            DataService.sharedDataSvc.REF_BASE.authUser(email, password: psw, withCompletionBlock: { err, authData in
                print("\(err)")
                
                if err.code == F_ERROR_USER_NOT_EXIST {
                   print("User not exist.Creat new user automaticly")
                    
                    DataService.sharedDataSvc.REF_BASE.createUser(email, password: psw, withValueCompletionBlock: { err, authData -> Void in
                        NSUserDefaults.standardUserDefaults().setValue(authData["uid"], forKey: KEY_UID)
                        self.performSegueWithIdentifier(SEGUE_LOGIN, sender: nil)
                    })
                }
                
                if err.code == F_ERROR_INVALID_EMAIL || err.code == F_ERROR_INVALID_PASSWORD {
                    self.showErrorAlart("Invalid email or password", msg: "Please chech your email and password")
                }
            })
            
        } else {
            showErrorAlart("Need email or password", msg: "Press in your email adress and password")
        }
    }
    
    func showErrorAlart(title: String, msg: String) {
        let alart = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alart.addAction(action)
        presentViewController(alart, animated: true, completion: nil)
    }
    
    
}










