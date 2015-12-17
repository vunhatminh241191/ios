//
//  FirstScreenViewController.swift
//  eber_ios
//  Copyright (c) 2015 Huy. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController, SignInViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper001")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "signin" {
            let destinationNavigationController = segue.destinationViewController as! UINavigationController
            let vc = destinationNavigationController.topViewController as! SignInViewController
            vc.delegate = self
        }
    }
    
    func didDoSomething(sender: SignInViewController) {
        dismissViewControllerAnimated(false, completion: nil)
        performSegueWithIdentifier("signup", sender: self)
    }
    
    

//    @IBAction func SignInPressed(sender: AnyObject) {
//        let SignUpVC = self.storyboard?.instantiateViewControllerWithIdentifier("signin") as! SignInViewController
//        self.presentViewController(SignUpVC, animated: true, completion: nil)
//    }
//    
//    @IBAction func SignUpPressed(sender: AnyObject) {
//        let SignInVC = self.storyboard?.instantiateViewControllerWithIdentifier("signup") as! SignUpViewController
//        self.presentViewController(SignInVC, animated: true, completion: nil)
//    }
//    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
