//
//  patientInsuranceModel.swift
//  ProviderPortal
//
//  Created by Hamza Ishaq on 11/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class patientInsuranceModel: NSObject {
    
    var payerName = String()
    var policyNo = String()
    var groupNo = String()
    var groupName = String()
    var copay = String()
    var coInsurance = String()
    var relationShip = String()
    var terminationDate = String()
    var terminateStatus = Bool()
    var subscriberName = String()
    var effectiveDate = String()
    var priSecOthType = String()
    
    init(payerName: String,policyNo: String,groupNo: String,groupName: String,copay: String,coInsurance: String,relationShip:String,terminationDate: String,terminateStatus: Bool,subscriberName: String,effectiveDate: String,priSecOthType: String) {
        
        self.payerName = payerName
        self.policyNo = policyNo
        self.groupNo = groupNo
        self.groupName = groupName
        self.copay = copay
        self.coInsurance = coInsurance
        self.relationShip = relationShip
        self.terminationDate = terminationDate
        self.terminateStatus = terminateStatus
        self.subscriberName = subscriberName
        self.effectiveDate = effectiveDate
        self.priSecOthType = priSecOthType
    }
    
    override init() {
        self.payerName = ""
        self.policyNo = ""
        self.groupNo = ""
        self.groupName = ""
        self.copay = ""
        self.coInsurance = ""
        self.relationShip = ""
        self.terminationDate = ""
        self.terminateStatus = false
        self.subscriberName = ""
        self.effectiveDate = ""
        self.priSecOthType = ""
    }
}
