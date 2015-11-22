//
//  FirstScreenViewController.swift
//  eber_ios
//  Copyright (c) 2015 Huy. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SignInPressed(sender: AnyObject) {
        let SignUpVC = self.storyboard?.instantiateViewControllerWithIdentifier("signin") as! SignInViewController
        self.presentViewController(SignUpVC, animated: true, completion: nil)
    }
    
    @IBAction func SignUpPressed(sender: AnyObject) {
        let SignInVC = self.storyboard?.instantiateViewControllerWithIdentifier("signup") as! SignUpViewController
        self.presentViewController(SignInVC, animated: true, completion: nil)
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
