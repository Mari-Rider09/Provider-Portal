//
//  patientClaimFilterPTLReason.swift
//  ProviderPortal
//
//  Created by Apple on 27/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class patientClaimFilterPTLReason: NSObject {

    var ptlReasonsId = Int()
    var ptlType = String()
    var reason = String()
    
    init(ptlReasonsId: Int,ptlType: String,reason: String) {
        self.ptlReasonsId = ptlReasonsId
        self.ptlType = ptlType
        self.reason = reason
    }
    
    override init() {
        self.ptlReasonsId = 0
        self.ptlType = ""
        self.reason = ""
    }
}
