//
//  patientClaimFilterSubmissionStatus.swift
//  ProviderPortal
//
//  Created by Apple on 27/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class patientClaimFilterSubmissionStatus: NSObject {

    var submissionStatusId = Int()
    var submissionStatus = String()
    
    init(submissionStatusId: Int,submissionStatus: String) {
        self.submissionStatusId = submissionStatusId
        self.submissionStatus = submissionStatus
    }
    
    override init() {
        self.submissionStatusId = 0
        self.submissionStatus = ""
    }
}
