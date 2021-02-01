//
//  patientInsuranceViewModel.swift
//  ProviderPortal
//
//  Created by Apple on 11/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import Alamofire

class patientInsuranceViewModel {
    
    var patientPimaryInsurance = [patientInsuranceModel]()
    var patientSeondaryInsurance = [patientInsuranceModel]()
    var patientTerminatedInsurance = [patientInsuranceModel]()
    var patientOtherInsurance = [patientInsuranceModel]()
    var vc: insuranceInformationViewController?
    
    func getInsuranceInformation() {
        let url = HelperClass.BASEURL + HelperClass.patientInsurance + "/\(patientId)" + "/Insurance"
        
        if ConnectionCheck.isConnectedToNetwork(){
            AF.request(url,method: .get,encoding: JSONEncoding.default,headers: headers).responseJSON { (response) in
                switch response.result{
                case .success( _):
                    
                    if response.response?.statusCode == 200 {
                        self.vc?.removeSpinner()
                        if response.value != nil{
                            guard let resp = response.value as? Dictionary<String,Any> else{return}
                            guard let List = resp["patientInsurances"] as? [Dictionary<String,Any>] else{return}
                            List.forEach { (data) in
                                let pName = data["name"] as? String ?? "PRI,42131,Administration"
                                let pNo = data["policyNumber"] as? String ?? ""
                                let gNo = data["groupNumber"] as? String ?? ""
                                let gName = data["groupName"] as? String ?? ""
                                let copay = data["coPay"] as? String ?? ""
                                let coInsu = data["coInsurance"] as? String ?? ""
                                let relation = data["relationship"] as? String ?? ""
                                let terminationDate = data["terminationDate"] as? String ?? ""
                                let terminationStatus = data["terminate"] as? Bool ?? false
                                let subName = data["subscriberName"] as? String ?? ""
                                let effecDate = data["effectiveDate"] as? String ?? ""
                                let priSecOthType = data["priSecOthType"] as? String ?? ""
                                let insuranceList = patientInsuranceModel(payerName: pName, policyNo: pNo, groupNo: gNo, groupName: gName, copay: copay, coInsurance: coInsu, relationShip: relation, terminationDate: terminationDate, terminateStatus: terminationStatus, subscriberName: subName, effectiveDate: effecDate, priSecOthType: priSecOthType)
                                if insuranceList.priSecOthType == "P" && insuranceList.terminateStatus == false{
                                    self.patientPimaryInsurance.append(insuranceList)
                                }else if insuranceList.priSecOthType == "S" && insuranceList.terminateStatus == false{
                                    self.patientSeondaryInsurance.append(insuranceList)
                                }else if insuranceList.priSecOthType == "O" && insuranceList.terminateStatus == false{
                                    self.patientOtherInsurance.append(insuranceList)
                                }else{
                                    self.patientTerminatedInsurance.append(insuranceList)
                                }
                                DispatchQueue.main.async {
                                    self.vc?.tableView.reloadData()
                                }
                            }
                        }else{
                            
                        }
                    }
                    
                case .failure(_):
                    self.vc?.showAlert("Error", message: "Server is not Accessible")
                }
            }
        }else{
            self.vc?.showAlert("Alert!", message: "check your internet connection")
        }
    }
}
