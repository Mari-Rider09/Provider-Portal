//
//  patientsModel.swift
//  ProviderPortal
//
//  Created by Apple on 04/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class patientsModel: NSObject {

    var rowNumber = Int()
    var patientId = Int()
    var lastName = String()
    var firstName = String()
    var fullName = String()
    var dateOfBirth = String()
    var martialStatus = String()
    var gender = String()
    var address = String()
    var name = String()
    var addressType = String()
    var city = String()
    var state = String()
    var zip = String()
    var isActive = Bool()
    var isPTL = Bool()
    var cell = String()
    
    
    init(rowNumber: Int,patientId: Int,lastName: String,firstName: String,fullName: String,dateOfBirth: String,martialStatus: String,gender: String,address: String,name: String,addressType: String,city: String,state: String,zip: String,isActive: Bool,isPTL: Bool,cell: String) {
        self.rowNumber = rowNumber
        self.patientId = patientId
        self.lastName = lastName
        self.firstName = firstName
        self.fullName = fullName
        self.dateOfBirth = dateOfBirth
        self.martialStatus = martialStatus
        self.gender = gender
        self.address = address
        self.name = name
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.isActive = isActive
        self.isPTL = isPTL
        self.cell = cell
    }
    override init() {
        self.rowNumber = 0
        self.patientId = 0
        self.lastName = ""
        self.firstName = ""
        self.fullName = ""
        self.dateOfBirth = ""
        self.martialStatus = ""
        self.gender = ""
        self.address = ""
        self.name = ""
        self.address = ""
        self.city = ""
        self.state = ""
        self.zip = ""
        self.isActive = false
        self.isPTL = false
        self.cell = ""
    }
}
