//
//  patientDocumentModel.swift
//  ProviderPortal
//
//  Created by Apple on 09/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class patientDocumentModel: NSObject {

    var documentDate = String()
    var documentName = String()
    var categoryName = String()
    var providerName = String()
    
    init(documentDate: String,documentName: String,categoryName: String,providerName: String) {
        self.documentDate = documentDate
        self.documentName = documentName
        self.categoryName = categoryName
        self.providerName = providerName
    }
    
    override init() {
        self.documentDate = ""
        self.documentName = ""
        self.categoryName = ""
        self.providerName = ""
    }
}
