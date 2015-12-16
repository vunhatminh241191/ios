//
//  User.swift
//  eber_ios
//
//  Created by Minh Vu on 12/9/15.
//  Copyright © 2015 Huy. All rights reserved.
//

import Foundation

class User {
    var firstName: String = ""
    var lastName: String = ""
    var phoneNumber: String = ""
    var address: String = ""
    var age: integer_t = 0
    var email: String = ""
    var city: String = ""
    var state: String = ""
    var zipcode: String = ""
    var date_of_birth: NSDate!
    var balance: integer_t = 0
    
    init(){}
    
    // set and get functions
    func getFirstName() -> String {return self.firstName}
    
    func setFirstName(first_name: String){self.firstName = first_name}

    func getLastName() -> String {return self.lastName}
    
    func setLastName(last_name: String){self.lastName = last_name}
    
    func getPhoneNumber() -> String {return self.phoneNumber}
    
    func setPhoneNumber(phone_number: String){self.phoneNumber = phone_number}
    
    func getAddress() -> String {return self.address}
    
    func setAddress(address: String){self.address = address}
    
    func getAge() -> integer_t{return self.age}
    
    func setAge(age: integer_t){self.age = age}
    
    func getEmail() -> String{return self.email}
    
    func setEmail(email: String){self.email=email}
    
    func getCity() -> String{return self.city}
    
    func setCity(city: String){self.city=city}
    
    func getState() -> String{return self.state}
    
    func setState(state: String){self.state=state}
    
    func getZipcode() -> String{return self.zipcode}
    
    func setZipcode(zipcode: String){self.zipcode=zipcode}
    
    func getBirthDate() -> NSDate{return self.date_of_birth}
    
    func setBirthDate(date: NSDate){self.date_of_birth = date}
    
    func getBalance() -> integer_t{return self.balance}
    
    func setBalance(balance: integer_t){self.balance=balance}
    
    // checking type of email
    func isvalidateEmail(email:String) -> Bool{
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(email)}
    
}