//
//  SignInViewController.swift
//  eber_ios
//
//  Created by Dharmesh on 18/09/15.
//  Copyright (c) 2015 Huy. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

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


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
