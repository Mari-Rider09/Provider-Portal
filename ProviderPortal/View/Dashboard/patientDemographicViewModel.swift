//
// patientDemographicViewModel.swift
// ProviderPortal
//
// Created by Apple on 05/11/2020.
// Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import Alamofire

class patientDemographicViewModel {
    
    var patientdemographic = patienDemographic()
    var vc: demographicViewController?
    
    func getPatientDemogrphic() {
        
        let url = HelperClass.BASEURL + HelperClass.patientDemographic + "/\(patientId)"
        if ConnectionCheck.isConnectedToNetwork(){
            
            guard let url = URL(string: url) else {return}
            
            AF.request(url, method:.get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
                .responseJSON{ responses in
                    if case .failure(let error) = responses.result
                    {
                        print(error.localizedDescription)
                        // print(error.responseCode!)
                        // self.vc?.showAlert("Error", message: "Server is not Accessible")
                    }else if case .success = responses.result
                    {
                        print(responses.value!)
                        print(responses.response?.statusCode as Any)
                        
                        if responses.response?.statusCode == 200{
                            if responses.value != nil{
                                if let arrays = responses.value as? [String: Any]{
                                    self.patientdemographic.patientId = arrays["patientId"] as? Int ?? 0
                                    self.patientdemographic.firstName = arrays["firstName"] as? String ?? ""
                                    self.patientdemographic.lastName = arrays["lastName"] as? String ?? ""
                                    self.patientdemographic.dateOfBirth = arrays["dateOfBirth"] as? String ?? ""
                                    self.patientdemographic.gender = arrays["gender"] as? String ?? ""
                                    self.patientdemographic.maritalStatus = arrays["maritalStatus"] as? String ?? ""
                                    self.patientdemographic.guarantorRelationship = arrays["guarantorRelationship"] as? String ?? ""
                                    self.patientdemographic.preferredLanguageId = arrays["preferredLanguageId"] as? Int ?? 0
                                    self.patientdemographic.address = arrays["address"] as? String ?? ""
                                    self.patientdemographic.addressType = arrays["addressType"] as? String ?? ""
                                    self.patientdemographic.zip = arrays["zip"] as? String ?? ""
                                    self.patientdemographic.city = arrays["city"] as? String ?? ""
                                    self.patientdemographic.state = arrays["state"] as? String ?? ""
                                    self.patientdemographic.ccp = arrays["ccp"] as? String ?? ""
                                    self.patientdemographic.isActive = arrays["isActive"] as? Bool ?? false
                                    self.patientdemographic.physicianId = arrays["physicianId"] as? Int ?? 0
                                    self.patientdemographic.practiceId = arrays["practiceId"] as? Int ?? 0
                                    self.patientdemographic.activeWebAccount = arrays["activeWebAccount"] as? Bool ?? false
                                    self.patientdemographic.isPTL = arrays["isPTL"] as? Bool ?? false
                                    self.patientdemographic.createdDate = arrays["createdDate"] as? String ?? ""
                                    self.patientdemographic.fileName = arrays["fileName"] as? String ?? ""
                                    self.patientdemographic.uploadFilesId = arrays["uploadFilesId"] as? Int ?? 0
                                    self.patientdemographic.fileLocation = arrays["fileLocation"] as? String ?? ""
                                    self.patientdemographic.isBilledToPatient = arrays["isBilledToPatient"] as? Bool ?? false
                                    self.patientdemographic.isQAVerified = arrays["isQAVerified"] as? Bool ?? false
                                    self.patientdemographic.isAuditVerified = arrays["isAuditVerified"] as? Bool ?? false
                                    self.patientdemographic.homePhone = arrays["homePhone"] as? String ?? ""
                                    self.patientdemographic.cell = arrays["cell"] as? String ?? ""
                                    self.patientdemographic.workPhone = arrays["workPhone"] as? String ?? ""
                                    self.patientdemographic.ext = arrays["ext"] as? String ?? ""
                                    self.patientdemographic.email = arrays["email"] as? String ?? ""
                                    self.patientdemographic.dateDisability = arrays["disabilityDate"] as? String ?? ""
                                    self.patientdemographic.dateDeath = arrays["deathDate"] as? String ?? ""
                                    self.patientdemographic.causeDeath = arrays["causeOfDeath"] as? String ?? ""
                                    self.patientdemographic.pharmacyName = arrays["pharmacyName"] as? String ?? ""
                                    
                                    
                                    DispatchQueue.main.async {
                                        self.vc?.tableView.reloadData()
                                    }
                                }
                            }
                        }else{
                            self.vc?.showAlert("Error 404!", message: "user not found")
                        }
                    }
            }
        }
    }
}
