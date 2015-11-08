//
//  SignInViewController.swift
//  eber_ios
//  Copyright (c) 2015 Huy. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class SignInViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet var passwordf: UITextField!
    @IBOutlet var emailf: UITextField!
    @IBAction func submit(sender: AnyObject) {
        let email = emailf.text! + " "
        let password = " " + passwordf.text! + " "
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) [0] as String
        let documentsDirectory = paths.stringByAppendingString("/UserInfo.txt")
        var userinfo : String = String()
        do{
            userinfo = try String(contentsOfFile: documentsDirectory, encoding: NSUTF8StringEncoding)
        }
        catch{}
        if userinfo.rangeOfString(email) != nil && userinfo.rangeOfString(password) != nil{
            print("exists")
        }
        else{
            print("invaled user")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            // User is already logged in, do work such as go to next view controller.
            self.returnUserData()

        }
        else
        {
            let loginView = FBSDKLoginButton()
            loginView.frame = CGRectMake(90, 100, 200, 30)
            self.view.addSubview(loginView)
            //loginView.center = self.view.center
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self
            self.returnUserData()
        }
        
//        let loginButton = FBSDKLoginButton()
//        loginButton.center = self.view.center;
//        loginButton.readPermissions = ["email"]
//        self.view.addSubview(loginButton)
//        loginButton.delegate = self;

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        self.returnUserData()
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
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id,email,name"])
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
               print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                print("User Name is: \(userName)")
                let id : NSString = result.valueForKey("id") as! NSString
                print("Id is: \(id)")
                if(result.valueForKey("email") != nil){
                let userEmail : NSString = result.valueForKey("email") as! NSString
                    print("User Email is: \(userEmail)")
                }
            }
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
