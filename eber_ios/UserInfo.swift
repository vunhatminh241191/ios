//
//  UserInfo.swift
//  eber_ios
//
//  Created by Huy on 9/19/15.
//  Copyright © 2015 Huy. All rights reserved.
//

import Foundation
import UIKit

var UserManager: UserManage = UserManage()

struct UserInfo{
    var email = ""
    var password = ""
    var phoneno = ""
}

class UserManage: NSObject {
    var UserInfos = [UserInfo ]()
    func adduser(newemail: String, newpassword: String, newphoneno: String){
        UserInfos.append(UserInfo(email: newemail, password: newpassword, phoneno: newphoneno))
    }
}