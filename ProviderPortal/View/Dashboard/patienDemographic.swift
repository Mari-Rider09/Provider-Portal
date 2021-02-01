//
//  patienDemographic.swift
//  ProviderPortal
//
//  Created by Apple on 05/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class patienDemographic: NSObject {

    var patientId = Int()
    var firstName = String()
    var lastName = String()
    var dateOfBirth = String()
    var gender = String()
    var maritalStatus = String()
    var guarantorRelationship = String()
    var preferredLanguageId = Int()
    var address = String()
    var addressType = String()
    var zip = String()
    var city = String()
    var state = String()
    var ccp = String()
    var isActive = Bool()
    var physicianId = Int()
    var practiceId = Int()
    var activeWebAccount = Bool()
    var isPTL = Bool()
    var createdDate = String()
    var fileName = String()
    var uploadFilesId = Int()
    var fileLocation = String()
    var isBilledToPatient = Bool()
    var isQAVerified = Bool()
    var isAuditVerified = Bool()
    var ssn = String()
    var raceName = String()
    var ethnicityName = String()
    var stateName = String()
    var homePhone = String()
    var cell = String()
    var workPhone = String()
    var ext = String()
    var email = String()
    var contact = String()
    var dateDisability = String()
    var dateDeath = String()
    var causeDeath = String()
    var pharmacyName = String()
    
    
    init(patientId: Int,firstName: String,lastName: String,dateOfBirth: String,gender: String,maritalStatus: String,guarantorRelationship: String,preferredLanguageId: Int,address: String,addressType: String,zip: String,city: String,state: String,ccp:String,isActive: Bool,physicianId: Int,practiceId: Int,activeWebAccount: Bool,isPTL: Bool,createdDate: String,fileName: String,uploadFilesId: Int,fileLocation: String,isBilledToPatient: Bool,isQAVerified: Bool,isAuditVerified: Bool,ssn: String,raceName: String,ethnicityName: String,stateName: String,homePhone: String,cell: String,workPhone: String,ext: String,email: String,contact: String,dateDisability: String,dateDeath: String,causeDeath: String,pharmacyName: String) {
        self.patientId = patientId
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.gender = gender
        self.maritalStatus = maritalStatus
        self.guarantorRelationship = guarantorRelationship
        self.preferredLanguageId = preferredLanguageId
        self.address = address
        self.addressType = addressType
        self.zip = zip
        self.city = city
        self.state = state
        self.ccp = ccp
        self.physicianId = physicianId
        self.practiceId = practiceId
        self.activeWebAccount = activeWebAccount
        self.isPTL = isPTL
        self.createdDate = createdDate
        self.fileName = fileName
        self.uploadFilesId = uploadFilesId
        self.fileLocation = fileLocation
        self.isBilledToPatient = isBilledToPatient
        self.isQAVerified = isQAVerified
        self.isAuditVerified = isAuditVerified
        self.ssn = ssn
        self.raceName = raceName
        self.ethnicityName = ethnicityName
        self.homePhone = homePhone
        self.cell = cell
        self.workPhone = workPhone
        self.ext = ext
        self.email = email
        self.dateDisability = dateDisability
        self.dateDeath = dateDeath
        self.causeDeath = causeDeath
        self.pharmacyName = pharmacyName
    }
    
    override init() {
       
        self.patientId = 0
        self.firstName = ""
        self.lastName = ""
        self.dateOfBirth = ""
        self.gender = ""
        self.maritalStatus = ""
        self.guarantorRelationship = ""
        self.preferredLanguageId = 0
        self.address = ""
        self.addressType = ""
        self.zip = ""
        self.city = ""
        self.state = ""
        self.ccp = ""
        self.physicianId = 0
        self.practiceId = 0
        self.activeWebAccount = false
        self.isPTL = false
        self.createdDate = ""
        self.fileName = ""
        self.uploadFilesId = 0
        self.fileLocation = ""
        self.isBilledToPatient = false
        self.isQAVerified = false
        self.isAuditVerified = false
        self.ssn = ""
        self.raceName = ""
        self.ethnicityName = ""
        self.homePhone = ""
        self.cell = ""
        self.workPhone = ""
        self.ext = ""
        self.email = ""
        self.dateDisability = ""
        self.dateDeath = ""
        self.causeDeath = ""
        self.pharmacyName = ""
    }
}

