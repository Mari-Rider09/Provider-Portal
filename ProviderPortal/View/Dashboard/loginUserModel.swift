//
//  loginUserModel.swift
//  ProviderPortal
//
//  Created by Apple on 03/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class loginUserModel: NSObject {

    var token = String()
    var userId = Int()
    var isActive = Bool()
    var userType = String()
    var userName = String()
    var firstName = String()
    var lastName = String()
    var middleName = String()
    var emailAddress = String()
    var phoneNumber = String()
    var serviceProviderId = Int()
    var practiceId = Int()
    var practiceLocationId = Int()
    var profilePicturePath = String()
    var isImported = Bool()
    var practiceName = String()
    var practiceLogo = String()
    var address = String()
    var city = String()
    var state = String()
    var zip = String()
    var contactPersonPhone = String()
    var practiceDeleted = Bool()
    
    init(token: String,userId: Int,isActive: Bool,userType: String,userName: String,firstName: String,lastName: String,middleName: String,emailAddress: String,phoneNumber:String,serviceProviderId: Int,practiceId: Int,practiceLocationId: Int,profilePicturePath: String,isImported: Bool,practiceName: String,practiceLogo:String,address: String,city: String,state: String,zip: String,contactPersonPhone: String,practiceDeleted: Bool) {
        
        self.token = token
        self.userId = userId
        self.isActive = isActive
        self.userType = userType
        self.userName = userName
        self.firstName = firstName
        self.lastName = lastName
        self.middleName = middleName
        self.emailAddress = emailAddress
        self.phoneNumber = phoneNumber
        self.serviceProviderId = serviceProviderId
        self.practiceId = practiceId
        self.practiceLocationId = practiceLocationId
        self.profilePicturePath = profilePicturePath
        self.isImported = isImported
        self.practiceName = practiceName
        self.practiceLogo = practiceLogo
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.contactPersonPhone = contactPersonPhone
        self.practiceDeleted = practiceDeleted
    }
    override init() {
        self.token = ""
        self.userId = 0
        self.isActive = false
        self.userType = ""
        self.userName = ""
        self.firstName = ""
        self.lastName = ""
        self.middleName = ""
        self.emailAddress = ""
        self.phoneNumber = ""
        self.serviceProviderId = 0
        self.practiceId = 0
        self.practiceLocationId = 0
        self.profilePicturePath = ""
        self.isImported = false
        self.practiceName = ""
        self.practiceLogo = ""
        self.address = ""
        self.city = ""
        self.state = ""
        self.zip = ""
        self.contactPersonPhone = ""
        self.practiceDeleted = false
    }
}
