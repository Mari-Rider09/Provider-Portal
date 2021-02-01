//
// patientClaimDetailModel.swift
// ProviderPortal
//
// Created by Apple on 13/11/2020.
// Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class patientClaimDetailModel: NSObject {
    
    var dos = String()
    var serviceLocation = String()
    var addmissionDate = String()
    var dischargeDate = String()
    
    init(dos: String,serviceLocation: String,addmissionDate: String,dischargeDate: String) {
        
        self.dos = dos
        self.serviceLocation = serviceLocation
        self.addmissionDate = addmissionDate
        self.dischargeDate = dischargeDate
    }
    override init() {
        self.dos = ""
        self.serviceLocation = ""
        self.addmissionDate = ""
        self.dischargeDate = ""
    }
}

class patientInformation: NSObject {
    var patientId = Int()
    var firstName = String()
    var lastName = String()
    var middleName = String()
    var address = String()
    var zip = String()
    var state = String()
    var city = String()
    var gender = String()
    var dob = String()
    
    init(patientId: Int,firstName: String,lastName: String,middleName: String,address: String,zip: String,state: String,city: String,gender: String,dob: String) {
        self.patientId = patientId
        self.firstName = firstName
        self.lastName = lastName
        self.middleName = middleName
        self.address = address
        self.zip = zip
        self.state = state
        self.city = city
        self.gender = gender
        self.dob = dob
    }
    
    override init() {
        self.patientId = 0
        self.firstName = ""
        self.lastName = ""
        self.middleName = ""
        self.address = ""
        self.zip = ""
        self.state = ""
        self.city = ""
        self.gender = ""
        self.dob = ""
    }
}
class paymentInformation: NSObject {
    var totalCharges = Double()
    var totalPayment = Double()
    var primaryPaid = Double()
    var secondaryPaid = Double()
    var otherPaid = Double()
    var patientPaid = Double()
    var balanceDue = Double()
    var adjusted = Double()
    
    init(totalCharges: Double,totalPayment: Double,primaryPaid: Double,secondaryPaid: Double,otherPaid: Double,patientPaid: Double,balanceDue: Double,adjusted: Double) {
        self.totalCharges = totalCharges
        self.totalPayment = totalPayment
        self.primaryPaid = primaryPaid
        self.secondaryPaid = secondaryPaid
        self.otherPaid = otherPaid
        self.patientPaid = patientPaid
        self.balanceDue = balanceDue
        self.adjusted = adjusted
    }
    override init() {
        self.totalCharges = 0
        self.totalPayment = 0
        self.primaryPaid = 0
        self.secondaryPaid = 0
        self.otherPaid = 0
        self.patientPaid = 0
        self.balanceDue = 0
        self.adjusted = 0
    }
}

class codeDiagnosis: NSObject {
    var dxCode1 = String()
    var dx1Description = String()
    var dxCode2 = String()
    var dx2Description = String()
    var dxCode3 = String()
    var dx3Description = String()
    var dxCode4 = String()
    var dx4Description = String()
    var dxCode5 = String()
    var dx5Description = String()
    var dxCode6 = String()
    var dx6Description = String()
    
    init(dxCode1: String,dx1Description: String,dxCode2: String,dx2Description: String,dxCode3: String,dx3Description: String,dxCode4: String,dx4Description: String,dxCode5: String,dx5Description: String,dxCode6: String,dx6Description: String) {
        self.dxCode1 = dxCode1
        self.dx1Description = dx1Description
        self.dxCode2 = dxCode2
        self.dx2Description = dx2Description
        self.dxCode3 = dxCode3
        self.dx3Description = dx3Description
        self.dxCode4 = dxCode4
        self.dx4Description = dx4Description
        self.dxCode5 = dxCode5
        self.dx5Description = dx5Description
        self.dxCode6 = dxCode6
        self.dx6Description = dx6Description
    }
    override init() {
        self.dxCode1 = ""
        self.dx1Description = ""
        self.dxCode2 = ""
        self.dx2Description = ""
        self.dxCode3 = ""
        self.dx3Description = ""
        self.dxCode4 = ""
        self.dx4Description = ""
        self.dxCode5 = ""
        self.dx5Description = ""
        self.dxCode6 = ""
        self.dx6Description = ""
    }
}
class paymentSummary: NSObject {
    var claimId = Int()
    var claimChargesId = Int()
    var cptCode = String()
    var dos = String()
    var cpTdescription = String()
    var totalCharges = String()
    var allowedAmount = String()
    var paidAmount = String()
    var priInsPaidAmount = String()
    var secInsPaidAmount = String()
    var othInsPaidAmount = String()
    var patPaidAmount = String()
    var adjustedAmount = String()
    var balanceDue = String()
    var serviceUnits = Int()
    var reasonCodes = String()
    
    init(claimId: Int,claimChargesId: Int,cptCode: String,dos: String,cpTdescription: String,totalCharges: String,allowedAmount: String,paidAmount: String,priInsPaidAmount: String,secInsPaidAmount: String,othInsPaidAmount: String,patPaidAmount: String,adjustedAmount: String,balanceDue: String,serviceUnits: Int,reasonCodes: String) {
        self.claimId = claimId
        self.claimChargesId = claimChargesId
        self.cptCode = cptCode
        self.dos = dos
        self.cpTdescription = cpTdescription
        self.totalCharges = totalCharges
        self.allowedAmount = allowedAmount
        self.paidAmount = paidAmount
        self.priInsPaidAmount = priInsPaidAmount
        self.secInsPaidAmount = secInsPaidAmount
        self.othInsPaidAmount = othInsPaidAmount
        self.patPaidAmount = patPaidAmount
        self.adjustedAmount = adjustedAmount
        self.balanceDue = balanceDue
        self.serviceUnits = serviceUnits
        self.reasonCodes = reasonCodes
    }
    override init() {
        self.claimId = 0
        self.claimChargesId = 0
        self.cptCode = ""
        self.dos = ""
        self.cpTdescription = ""
        self.totalCharges = ""
        self.allowedAmount = ""
        self.paidAmount = ""
        self.priInsPaidAmount = ""
        self.secInsPaidAmount = ""
        self.othInsPaidAmount = ""
        self.patPaidAmount = ""
        self.adjustedAmount = ""
        self.balanceDue = ""
        self.serviceUnits = 0
        self.reasonCodes = ""
    }
}

class paymentDetail: NSObject {
    var claimId = Int()
    var dos = String()
    var claimCHargesId = Int()
    var cpTdescription = String()
    var totalCharges = String()
    var procedurePaymentsId = Int()
    var paymentSource = String()
    var checkNumber = String()
    var checkDate = String()
    var allowedAmount = String()
    var paidAmount = String()
    var procedureAdjustmentId = Int()
    
    var adjustedAmount = Int()
    
    init(claimId: Int,dos: String,claimCHargesId: Int,cpTdescription: String,totalCharges: String,procedurePaymentsId: Int,paymentSource: String,checkNumber: String,checkDate: String,allowedAmount:String,paidAmount:String,procedureAdjustmentId: Int,adjustedAmount: Int) {
        self.claimId = claimId
        self.dos = dos
        self.claimCHargesId = claimCHargesId
        self.cpTdescription = cpTdescription
        self.totalCharges = totalCharges
        self.procedurePaymentsId = procedurePaymentsId
        self.paymentSource = paymentSource
        self.checkNumber = checkNumber
        self.checkDate = checkDate
        self.allowedAmount = allowedAmount
        self.paidAmount = paidAmount
        self.procedurePaymentsId = procedurePaymentsId
        
        self.adjustedAmount = adjustedAmount
    }
    override init() {
        self.claimId = 0
        self.dos = ""
        self.claimCHargesId = 0
        self.cpTdescription = ""
        self.totalCharges = ""
        self.procedurePaymentsId = 0
        self.paymentSource = ""
        self.checkNumber = ""
        self.checkDate = ""
        self.allowedAmount = ""
        self.paidAmount = ""
        self.procedurePaymentsId = 0
        
        self.adjustedAmount = 0
    }
}

class claimNotes: NSObject {
    var claimNotesId = Int()
    var patientId = Int()
    var notes = String()
    var userId = Int()
    var userName = String()
    var noteDate = String()
    var categoryName = String()
    var isProvider = Bool()
    
    init(claimNotesId: Int,patientId: Int,notes: String,userId: Int,userName: String,noteDate: String,categoryName: String,isProvider: Bool) {
        self.claimNotesId = claimNotesId
        self.patientId = patientId
        self.notes = notes
        self.userId = userId
        self.userName = userName
        self.noteDate = noteDate
        self.categoryName = categoryName
        self.isProvider = isProvider
    }
    override init() {
        self.claimNotesId = 0
        self.patientId = 0
        self.notes = ""
        self.userId = 0
        self.userName = ""
        self.noteDate = ""
        self.categoryName = ""
        self.isProvider = false
    }
}
class claimStatus: NSObject {
    var claimId = Int()
    var patient = String()
    var patientId = Int()
    var dos = String()
    var priStatus = String()
    var secStatus = String()
    var patStatus = String()
    var priInsurance = String()
    
    
    init(claimId: Int,patient: String,patientId: Int,dos: String,priStatus: String,secStatus: String,patStatus: String,priInsurance: String) {
        self.claimId = claimId
        self.patient = patient
        self.patientId = patientId
        self.dos = dos
        self.priStatus = priStatus
        self.secStatus = secStatus
        self.patStatus = patStatus
        self.priInsurance = priInsurance
    }
    override init() {
        self.claimId = 0
        self.patient = ""
        self.patientId = 0
        self.dos = ""
        self.priStatus = ""
        self.secStatus = ""
        self.patStatus = ""
        self.priInsurance = ""
    }
}
class claimInfo: NSObject {
    var claimId = Int()
    var primaryStatus = String()
    var dos = String()
    var primary = [primaryInsurance]()
    var secondary = [secondaryInsurance]()
    
    
    init(claimId: Int,primaryStatus: String,dos: String,primary: [primaryInsurance],secondary: [secondaryInsurance]) {
        self.claimId = claimId
        self.primaryStatus = primaryStatus
        self.dos = dos
        self.primary = primary
        self.secondary = secondary
    }
    override init() {
        self.claimId = 0
        self.primaryStatus = ""
        self.dos = ""
        self.primary = []
        self.secondary = []
    }
}
class primaryInsurance: NSObject {
    var insuranceId = Int()
    var primaryInsurance = String()
    var policyNumber = String()
    
    init(insuranceId: Int,primaryInsurance: String,policyNumber: String) {
        self.insuranceId = insuranceId
        self.primaryInsurance = primaryInsurance
        self.policyNumber = policyNumber
    }
    override init() {
        self.insuranceId = 0
        self.primaryInsurance = ""
        self.policyNumber = ""
    }
}
class secondaryInsurance: NSObject {
    var insuranceId = Int()
    var secondaryInsurance = String()
    var policyNumber = String()
    
    init(insuranceId: Int,secondaryInsurance: String,policyNumber: String) {
        self.insuranceId = insuranceId
        self.secondaryInsurance = secondaryInsurance
        self.policyNumber = policyNumber
    }
    override init() {
        self.insuranceId = 0
        self.secondaryInsurance = ""
        self.policyNumber = ""
    }
}

