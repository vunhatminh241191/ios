//
//  StartViewController.swift
//  eber_ios
//
//  Created by Momoko Saunders on 12/17/15.
//  Copyright © 2015 Huy. All rights reserved.
//

import Foundation
import UIKit

class StartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.performSegueWithIdentifier("Login", sender: self)
    }
}
