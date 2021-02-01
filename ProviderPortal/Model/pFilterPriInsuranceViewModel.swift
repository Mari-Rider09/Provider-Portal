//
//  pFilterPriInsuranceViewModel.swift
//  ProviderPortal
//
//  Created by Apple on 27/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import Alamofire

class pFilterPriInsuranceViewModel {
    
    var vc: patientFiterViewController? = nil
    var vc1: ClaimFilterViewController?
    
    var pFilterPriInsuranceArray = [patientFilterPriInsuranceModel]()
    var subStatusArray = [patientClaimFilterSubmissionStatus]()
    var PTLReasonArray = [patientClaimFilterPTLReason]()
    
    var primaryInsurance = [String]()
    var submisionStatus = [String]()
    var PTLReason = [String]()
    
    
    func getPriInsurance() {
//        let urls = "http://providerapi.maxremind.biz/api/Insurance/GetAllInsuranceHaveClaims"
        guard let url = URL(string: HelperClass.BASEURL + HelperClass.getInsurance) else {return}
        
        if ConnectionCheck.isConnectedToNetwork(){
            AF.request(url, method:.get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
                
                switch response.result{
                case .success( _):
                    if response.response?.statusCode == 200{
                        if response.value != nil{
                          guard let resp = response.value as? [Dictionary<String,Any>] else{return}
                            resp.forEach { (data) in
                                let iId = data["insuranceId"] as? Int ?? 0
                                let insName = data["insuranceName"] as? String ?? ""
                                let tclaim = data["totalClaim"] as? Int ?? 0
                                let deleted = data["deleted"] as? Bool ?? false
                                self.primaryInsurance.append(data["insuranceName"] as? String ?? "")
                                let List = patientFilterPriInsuranceModel(insuranceId: iId, insuranceName: insName, totalClaim: tclaim, deleted: deleted)
                                self.pFilterPriInsuranceArray.append(List)
                            }
                            self.vc1?.priInsuranceDropDown.optionArray = self.primaryInsurance
                        }
                    }
                case .failure(_):
                    print("try again")
                }
            }
        }else{
            self.vc?.showAlert("Error", message: "Server is not Accessible")
        }
    }
    
    func getSubmissionStatus() {
        
        guard let url = URL(string: HelperClass.BASEURL + HelperClass.getSubmissionStatus) else {return}
        if ConnectionCheck.isConnectedToNetwork(){
            AF.request(url,method: .get,parameters: nil,encoding: JSONEncoding.default,headers: headers).responseJSON { (response) in
                switch response.result{
                    
                case .success(_):
                    if response.response?.statusCode == 200{
                        guard let resp = response.value as? [Dictionary<String,Any>] else{return}
                        resp.forEach { (data) in
                            let subId = data["submissionStatusId"] as? Int ?? 0
                            let subStatus = data["submissionStatus"] as? String ?? ""
                            self.submisionStatus.append(data["submissionStatus"] as? String ?? "")
                            let List = patientClaimFilterSubmissionStatus(submissionStatusId: subId, submissionStatus: subStatus)
                            self.subStatusArray.append(List)
                        }
                        self.vc1?.submissionStatusDropDown.optionArray = self.submisionStatus
                    }
                case .failure(_):
                     print("try again")
                }
            }
        }else{
            self.vc?.showAlert("Error", message: "Server is not Accessible")
        }
    }
    
    func getPTLReason(){
        
        guard let url = URL(string: HelperClass.BASEURL + HelperClass.getPTLReason) else {return}
        if ConnectionCheck.isConnectedToNetwork(){
            AF.request(url,method: .get,encoding: JSONEncoding.default,headers: headers).responseJSON { (response) in
                switch response.result{
                    
                case .success(_):
                    if response.response?.statusCode == 200{
                        guard let resp = response.value as? [Dictionary<String,Any>] else{return}
                        resp.forEach { (data) in
                            let ptlReasonsId = data["ptlReasonsId"] as? Int ?? 0
                            let ptlType = data["ptlType"] as? String ?? ""
                            let reason = data["reason"] as? String ?? ""
                            self.PTLReason.append(data["reason"] as? String ?? "")
                            
                            let List = patientClaimFilterPTLReason(ptlReasonsId: ptlReasonsId, ptlType: ptlType, reason: reason)
                            self.PTLReasonArray.append(List)
                        }
                        self.vc1?.ptlReasonDropDown.optionArray = self.PTLReason
                    }
                case .failure(_): 
                    print("try again")
                }
            }
        }else{
            self.vc1?.showAlert("Error", message: "Server is not Accessible")
        }
    }
}
