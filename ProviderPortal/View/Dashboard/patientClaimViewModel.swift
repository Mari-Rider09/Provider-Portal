//
//  patientClaimViewModel.swift
//  ProviderPortal
//
//  Created by Apple on 09/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import Alamofire
class patientClaimViewModel {
    
    var patientclaim = [patientClaimModel]()
    var vc: claimViewController?
    
    func getPatientClaim(pn: Int,param: Parameters) {
        
        let url = HelperClass.BASEURL + HelperClass.patientClaim + "/\(patientId)" + "/Claim/Filter"
        
        print(param)
        AF.request(url, method: .post, parameters: param, encoding: JSONEncoding.default,headers: headers).responseJSON{ response in
            if pn == 0 {
                self.patientclaim.removeAll()
            }
            if ConnectionCheck.isConnectedToNetwork(){
                switch response.result {
                case .success(_):
                    guard let resp = response.value as? Dictionary<String,Any> else{return}
                    guard let List = resp["claims"] as? [Dictionary<String,Any>] else{return}
                    List.forEach{ (data) in
                        let rnumber = data["rowNumber"] as? Int ?? 0
                        let cId = data["claimId"] as? Int ?? 0
                        let pId = data["patientId"] as? Int ?? 0
                        let dos = data["dos"] as? String ?? ""
                        let ctotal = data["claimTotal"] as? Double ?? 0.0
                        let amPaid = data["amountPaid"] as? Double ?? 0.0
                        let adjus = data["adjustment"] as? Double ?? 0.0
                        let amDue = data["amountDue"] as? Int ?? 0
                        let name = data["name"] as? String ?? ""
                        let subStatus = data["submissionStatus"] as? String ?? ""
                        let ptlReason = data["ptlReasons"] as? String ?? ""
                        let ptlNotes = data["ptlNotes"] as? String ?? ""
                        
                        let cList = patientClaimModel(rowNumber: rnumber, claimId: cId, patientId: pId, dos: dos, claimTotal: ctotal, amountPaid: amPaid, adjustment: adjus, amountDue: amDue, name: name, submissionStatus: subStatus, ptlReasons: ptlReason, ptlNotes: ptlNotes)
                        
                        self.patientclaim.append(cList)
                    }
                    DispatchQueue.main.async {
                        self.vc?.tableView.reloadData()
                    }
                case .failure(let error):
                    print("Error==",error)
                }
            }else{
                self.vc?.showAlert("Error 404!", message: "user not found")
            }
        }
    }
}
