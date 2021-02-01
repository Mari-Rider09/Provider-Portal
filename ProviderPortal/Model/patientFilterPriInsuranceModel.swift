//
//  patientFilterPriInsuranceModel.swift
//  ProviderPortal
//
//  Created by Apple on 27/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class patientFilterPriInsuranceModel: NSObject {

    var insuranceId = Int()
    var insuranceName = String()
    var totalClaim = Int()
    var deleted = Bool()
    
    init(insuranceId: Int,insuranceName: String,totalClaim: Int,deleted: Bool) {
        self.insuranceId = insuranceId
        self.insuranceName = insuranceName
        self.totalClaim = totalClaim
        self.deleted = deleted
    }
    
    override init() {
        self.insuranceId = 0
        self.insuranceName = ""
        self.totalClaim = 0
        self.deleted = false
    }
}
