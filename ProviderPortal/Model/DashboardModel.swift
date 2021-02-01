//
//  DashboardModel.swift
//  ProviderPortal
//
//  Created by Apple on 22/12/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class DashboardModel: NSObject {

}
class providers: NSObject {
    var practiceStaffId = Int()
    var practiceId = Int()
    var name = String()
    
    init(psId: Int,pid: Int,name: String) {
        self.practiceStaffId = psId
        self.practiceId = pid
        self.name = name
    }
    override init() {
        self.practiceStaffId = 0
        self.practiceId = 0
        self.name = ""
    }
}

class paymentDues: NSObject {
    var charges = Double()
    var payments = Double()
    var adjustments = Double()
    var balanceDue = Double()
    var patientPaidAmt = Double()
    
    init(charges: Double,payments: Double,adjustments: Double,balanceDue: Double,patientPaidAmt: Double) {
        self.charges = charges
        self.payments = payments
        self.adjustments = adjustments
        self.balanceDue = balanceDue
        self.patientPaidAmt = patientPaidAmt
    }
    override init() {
        self.charges = 0.0
        self.payments = 0.0
        self.adjustments = 0.0
        self.balanceDue = 0.0
        self.patientPaidAmt = 0.0
    }
}

class barChartData: NSObject {
    var totalCharges = Double()
    var paidAmount = Double()
    var adjustedAmount = Double()
    var serviceDate = String()
    
    init(tCharges: Double, pAmount: Double, adjAmount: Double,servDate: String) {
        self.totalCharges = tCharges
        self.paidAmount = pAmount
        self.adjustedAmount = adjAmount
        self.serviceDate = servDate
    }
    override init() {
        self.totalCharges = 0.0
        self.paidAmount = 0.0
        self.adjustedAmount = 0.0
        self.serviceDate = ""
    }
}

class adjustmentRatioChart: NSObject {
    var paymentchargesratio = NSNumber()
    var chargesadjustmentratio = NSNumber()
    var serviceDate = String()
    
    init(pcratio: NSNumber,cjratio: NSNumber,serviceDate: String) {
        self.paymentchargesratio = pcratio
        self.chargesadjustmentratio = cjratio
        self.serviceDate = serviceDate
    }
    override init() {
        self.paymentchargesratio = 0
        self.chargesadjustmentratio = 0
        self.serviceDate = ""
    }
}

class claimSubmissionChart: NSObject {
    var numberofclaims = NSNumber()
    var submissionStatus = String()
    
    init(noclaims: NSNumber, subStatus: String) {
        self.numberofclaims = noclaims
        self.submissionStatus = subStatus
    }
    override init() {
        self.numberofclaims = 0
        self.submissionStatus = String()
    }
}

class submissionAgingReportChart: NSObject {
    var submissionStatus = String()
    var zeroseven = Int()
    var eightfifteen = Int()
    var sixteentwentyone = Int()
    var abovetwentyone = Int()
    
    init(subStatus: String,zs: Int,ef: Int,stwentyone: Int,abovetwentyone:Int) {
        self.submissionStatus = subStatus
        self.zeroseven = zs
        self.eightfifteen = ef
        self.sixteentwentyone = stwentyone
        self.abovetwentyone = abovetwentyone
        
    }
    override init() {
        self.submissionStatus = ""
        self.zeroseven = 0
        self.eightfifteen = 0
        self.sixteentwentyone = 0
        self.abovetwentyone = 0
    }
}

class claimDistributionChart: NSObject {
    var numberofclaims = Int()
    var name = String()
    
    init(noclaim: Int,name: String) {
        self.numberofclaims = noclaim
        self.name = name
    }
    override init() {
        self.numberofclaims = 0
        self.name = ""
    }
}

class Location: NSObject {
    var practicelocations = [practiceLocations]()
    var locationddl = [locationDDL]()
    
    init(pLocations: [practiceLocations],locationddl: [locationDDL]) {
        self.practicelocations = pLocations
        self.locationddl = locationddl
    }
    override init() {
        self.practicelocations = []
        self.locationddl = []
    }
}

class practiceLocations: NSObject {
    var practiceLocationsId = Int()
    var name = String()
    var city = String()
    var stateCode = String()
    var zip = String()
    var address = String()
    var taxId = Int()
    var npi = Int()
    
    init(plId: Int,name: String,city: String,stateCode: String,zip: String,address: String,taxId: Int,npi: Int) {
        self.practiceLocationsId = plId
        self.name = name
        self.city = city
        self.stateCode = stateCode
        self.zip = zip
        self.address = address
        self.taxId = taxId
        self.npi = npi
    }
    override init() {
        self.practiceLocationsId = 0
        self.name = ""
        self.city = ""
        self.stateCode = ""
        self.zip = ""
        self.address = ""
        self.taxId = 0
        self.npi = 0
    }
}
class locationDDL: NSObject {
    var ddlId = Int()
    var name = String()
    
    init(ddlId: Int,name: String) {
        self.ddlId = ddlId
        self.name = name
    }
    override init() {
        self.ddlId = 0
        self.name = ""
    }
}
