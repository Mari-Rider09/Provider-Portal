//
//  patientClaimModel.swift
//  ProviderPortal
//
//  Created by Apple on 09/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class patientClaimModel: NSObject {

    var rowNumber = Int()
    var claimId = Int()
    var patientId = Int()
    var dos = String()
    var claimTotal = Double()
    var amountPaid = Double()
    var adjustment = Double()
    var amountDue = Int()
    var name = String()
    var submissionStatus = String()
    var ptlReasons = String()
    var ptlNotes = String()
    
    init(rowNumber: Int,claimId: Int,patientId: Int,dos: String,claimTotal:Double,amountPaid: Double,adjustment: Double,amountDue: Int,name: String,submissionStatus: String,ptlReasons: String,ptlNotes: String) {
        self.rowNumber = rowNumber
        self.claimId = claimId
        self.patientId = patientId
        self.dos = dos
        self.claimTotal = claimTotal
        self.amountPaid = amountPaid
        self.adjustment = adjustment
        self.amountDue = amountDue
        self.name = name
        self.submissionStatus = submissionStatus
        self.ptlReasons = ptlReasons
        self.ptlNotes = ptlNotes
    }
    
    override init() {
        self.rowNumber = 0
        self.claimId = 0
        self.patientId = 0
        self.dos = ""
        self.claimTotal = 0.0
        self.amountPaid = 0.0
        self.adjustment = 0.0
        self.amountDue = 0
        self.name = ""
        self.submissionStatus = ""
        self.ptlReasons = ""
        self.ptlNotes = ""
    }
}
