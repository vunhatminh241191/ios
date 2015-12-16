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
    @IBOutlet var signin_title: UINavigationBar!
    let user = User()
    
    /*@IBAction func submit(sender: AnyObject) {
        let email = emailf.text! + " "
        let password = " " + password_text_field.text! + " "
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
            print("invalid user")
        }
        
    }*/
    @IBAction func BackToFS(sender: AnyObject) {
        let FirstScreen = self.storyboard?.instantiateViewControllerWithIdentifier("firstscreen") as! FirstScreenViewController
        self.presentViewController(FirstScreen, animated: true, completion: nil)
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
        // Do any additional setup after loading the view.
        let rightButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "login")
        self.navigationItem.rightBarButtonItem = rightButton
        
        let leftButton = UIBarButtonItem(title:"Back", style: .Plain, target:self, action: "moving_back")
        self.navigationItem.leftBarButtonItem = leftButton
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // login to facebook result
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
    // ending login to facebook function
    
    // login to normal user accounts
    func login() {
        let email_text = emailf.text!
        let password_text = passwordf.text!
        
        if (password_text.isEmpty || password_text.isEmpty){
            self.view.makeToast(message: "Please input your missing string", duration: 2.0, position: "center")
            return}
        
        if (user.isvalidateEmail(email_text) == false){
            self.view.makeToast(message: "Your email input type does not correct", duration: 2.0, position: "center")
            return}
        
        else {
            let info = ["email":email_text, "password":password_text]
            let server_login = ServerPost(url: NSLocalizedString("sign_in", comment: ""), data: info)
            server_login.connection{(success, data)-> Void in
                if (success) {
                    if let unwrappedData = data {
                        if let responseString = String(data: unwrappedData, encoding: NSUTF8StringEncoding) {
                            self.Type_Of_SignIn(responseString)
                        }
                    }
                }
                else { print("Failed") }
            }
        }
    }
    
    func Type_Of_SignIn(data: String){
        /*
        if (data.characters.count == 1){
            if (data == "1"){
                self.view.makeToast(message: NSLocalizedString("1", comment: ""), duration:2.0, position:"center")
            }
        }*/
        if (data == NSLocalizedString("1", comment: "")){
            self.view.makeToast(message: NSLocalizedString("1", comment: ""), duration:2.0, position:"center")
            performSegueWithIdentifier("signup", sender: nil)}
        else if (data == NSLocalizedString("2", comment: "")){
            self.view.makeToast(message: NSLocalizedString("2", comment: ""), duration:2.0, position:"center")}
        
        
        
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