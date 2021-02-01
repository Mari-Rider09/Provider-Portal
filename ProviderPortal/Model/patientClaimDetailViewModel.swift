//
// patientClaimDetailViewModel.swift
// ProviderPortal
//
// Created by Apple on 13/11/2020.
// Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import Alamofire

class patientClaimDetailViewModel{
    
    var claimDetailModel = patientClaimDetailModel()
    var patientinfo = patientInformation()
    var paymentinfo = paymentInformation()
    var dxcodediagnoses = codeDiagnosis()
    var paymentsumarryArray = [paymentSummary]()
    var paymentdetailArray = [paymentDetail]()
    var claimnotesArray = [claimNotes]()
    var claimstatus = claimStatus()
    var claiminfo = claimInfo()
    var dxCodeValue = [String]()
    var dxCodeDescription = [String]()
    var vc: claimDetailViewController?
    func getPatientClaimDetail(claimid: Int) {
        
        let urls = HelperClass.BASEURL + HelperClass.claimDetail + "/\(claimid)" + "/\(practiceId)" + "/\(patientId)"
        guard let url = URL(string: urls) else {return}
        if ConnectionCheck.isConnectedToNetwork(){
            AF.request(url, method:.get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON{ (response) in
                switch response.result{
                case .success(_):
                    if response.response?.statusCode == 200{
                        if response.value != nil{
                            //MARK:- get all response of api in objects and arrays
                            guard let resp = response.value as? Dictionary<String,Any> else{return}
                            
                            
                            //MARK:- map the response in model classess
                            self.claimDetailModel.dos = resp["dos"] as? String ?? ""
                            self.claimDetailModel.serviceLocation = resp["serviceLocation"] as? String ?? ""
                            self.claimDetailModel.addmissionDate = resp["addmissionDate"] as? String ?? ""
                            self.claimDetailModel.dischargeDate = resp["dischargeDate"] as? String
                                ?? ""
                            
                            //MARK:- patient Information object set in model
                            if let arrays = resp["patientinfo"] as? Dictionary<String,Any>{
                                self.patientinfo.patientId = arrays["patientId"] as? Int ?? 0
                                self.patientinfo.firstName = arrays["firstName"] as? String ?? ""
                                self.patientinfo.lastName = arrays["lastName"] as? String ?? ""
                                self.patientinfo.middleName = arrays["middleName"] as? String ?? ""
                                self.patientinfo.address = arrays["address"] as? String ?? ""
                                self.patientinfo.zip = arrays["zip"] as? String ?? ""
                                self.patientinfo.state = arrays["state"] as? String ?? ""
                                self.patientinfo.city = arrays["city"] as? String ?? ""
                                self.patientinfo.gender = arrays["gender"] as? String ?? ""
                                self.patientinfo.dob = arrays["dob"] as? String ?? ""
                            }//end
                            
                            //MARK:- payment Inofrmation object set in model
                            if let arrays = resp["paymentInfo"] as? Dictionary<String,Any>{
                                self.paymentinfo.totalCharges = arrays["totalCharges"] as? Double ?? 0
                                self.paymentinfo.totalPayment = arrays["totalPayment"] as? Double ?? 0
                                self.paymentinfo.primaryPaid = arrays["primaryPaid"] as? Double ?? 0
                                self.paymentinfo.secondaryPaid = arrays["secondaryPaid"] as? Double ?? 0
                                self.paymentinfo.otherPaid = arrays["otherPaid"] as? Double ?? 0
                                self.paymentinfo.patientPaid = arrays["patientPaid"] as? Double ?? 0
                                self.paymentinfo.balanceDue = arrays["balanceDue"] as? Double ?? 0
                                self.paymentinfo.adjusted = arrays["adjusted"] as? Double ?? 0
                            }//end
                            
                            //MARK:- dxCodeDiagnosis object set in model
                            if let dxcode = resp["dxCodeDiagnosis"] as? Dictionary<String,Any>{
                                
                                self.dxCodeValue.append(dxcode["dxCode1"] as? String ?? "")
                                self.dxCodeDescription.append(dxcode["dx1Description"] as? String ?? "")
                                
                                self.dxCodeValue.append(dxcode["dxCode2"] as? String ?? "")
                                self.dxCodeDescription.append(dxcode["dx2Description"] as? String ?? "")
                                
                                self.dxCodeValue.append(dxcode["dxCode3"] as? String ?? "")
                                self.dxCodeDescription.append(dxcode["dx3Description"] as? String ?? "")
                                
                                self.dxCodeValue.append(dxcode["dxCode4"] as? String ?? "")
                                self.dxCodeDescription.append(dxcode["dx4Description"] as? String ?? "")
                                
                                self.dxCodeValue.append(dxcode["dxCode5"] as? String ?? "")
                                self.dxCodeDescription.append(dxcode["dx5Description"] as? String ?? "")
                                
                                self.dxCodeValue.append(dxcode["dxCode6"] as? String ?? "")
                                self.dxCodeDescription.append(dxcode["dx6Description"] as? String ?? "")
                            }// end
                            
                            //MARK:- paymentSummary Array set in model
                            guard let paymentsummary = resp["paymentSummary"] as? [Dictionary<String,Any>] else{return}
                            paymentsummary.forEach { (data) in
                                let claimId = data["claimId"] as? Int ?? 0
                                let claimChargesId = data["claimChargesId"] as? Int ?? 0
                                let cptCode = data["cptCode"] as? String ?? ""
                                let dos = data["dos"] as? String ?? ""
                                let cpTdescription = data["cpTdescription"] as? String ?? ""
                                let totalCharges = data["totalCharges"] as? String ?? ""
                                let allowedAmount = data["allowedAmount"] as? String ?? ""
                                let paidAmount = data["paidAmount"] as? String ?? ""
                                let priInsPaidAmount = data["priInsPaidAmount"] as? String ?? ""
                                let secInsPaidAmount = data["secInsPaidAmount"] as? String ?? ""
                                let othInsPaidAmount = data["othInsPaidAmount"] as? String ?? ""
                                let patPaidAmount = data["patPaidAmount"] as? String ?? ""
                                let adjustedAmount = data["adjustedAmount"] as? String ?? ""
                                let balanceDue = data["balanceDue"] as? String ?? ""
                                let serviceUnits = data["serviceUnits"] as? Int ?? 0
                                let reasonCodes = data["reasonCodes"] as? String ?? ""
                                
                                let psummary = paymentSummary(claimId: claimId, claimChargesId: claimChargesId, cptCode: cptCode, dos: dos, cpTdescription: cpTdescription, totalCharges: totalCharges, allowedAmount: allowedAmount, paidAmount: paidAmount, priInsPaidAmount: priInsPaidAmount, secInsPaidAmount: secInsPaidAmount, othInsPaidAmount: othInsPaidAmount, patPaidAmount: patPaidAmount, adjustedAmount: adjustedAmount, balanceDue: balanceDue, serviceUnits: serviceUnits, reasonCodes: reasonCodes)
                                
                                self.paymentsumarryArray.append(psummary)
                            }//end
                            
                            //MARK:- paymentDtail Array set in model
                            guard let paymentdetail = resp["paymentDetail"] as? [Dictionary<String,Any>] else{return}
                            paymentdetail.forEach { (data) in
                                if let abc = data["paymentDetail"] as? Dictionary<String,Any> {
                                    let claimId = abc["claimId"] as? Int ?? 0
                                    let dos = abc["dos"] as? String ?? ""
                                    let claimCHargesId = abc["claimCHargesId"] as? Int ?? 0
                                    let cpTdescription = abc["cpTdescription"] as? String ?? ""
                                    let totalCharges = abc["totalCharges"] as? String ?? ""
                                    let procedurePaymentsId = abc["procedurePaymentsId"] as? Int ?? 0
                                    let paymentSource = abc["paymentSource"] as? String ?? ""
                                    let checkNumber = abc["checkNumber"] as? String ?? ""
                                    let checkDate = abc["checkDate"] as? String ?? ""
                                    let allowedAmount = abc["allowedAmount"] as? String ?? ""
                                    let paidAmount = abc["paidAmount"] as? String ?? ""
                                    let procedureAdjustmentId = abc["procedureAdjustmentId"] as? Int ?? 0
                                    let adjustedAmount = abc["adjustedAmount"] as? Int ?? 0
                                    let pdetail = paymentDetail(claimId: claimId, dos: dos, claimCHargesId: claimCHargesId, cpTdescription: cpTdescription, totalCharges: totalCharges, procedurePaymentsId: procedurePaymentsId, paymentSource: paymentSource, checkNumber: checkNumber, checkDate: checkDate, allowedAmount: allowedAmount, paidAmount: paidAmount, procedureAdjustmentId: procedureAdjustmentId, adjustedAmount: adjustedAmount)
                                    self.paymentdetailArray.append(pdetail)
                                }
                                
                            }//end
                            
                            //MARK:- claimNotes Array set in Model
                            guard let claimnotes = resp["claimNotes"] as? [Dictionary<String,Any>] else{return}
                            claimnotes.forEach { (data) in
                                let claimNotesId = data["claimNotesId"] as? Int ?? 0
                                let patientId = data["patientId"] as? Int ?? 0
                                let notes = data["notes"] as? String ?? ""
                                let userId = data["userId"] as? Int ?? 0
                                let userName = data["userName"] as? String ?? ""
                                let noteDate = data["noteDate"] as? String ?? ""
                                let categoryName = data["categoryName"] as? String ?? ""
                                let isProvider = data["isProvider"] as? Bool ?? false
                                
                                let cnotes = claimNotes(claimNotesId: claimNotesId, patientId: patientId, notes: notes, userId: userId, userName: userName, noteDate: noteDate, categoryName: categoryName, isProvider: isProvider)
                                self.claimnotesArray.append(cnotes)
                            }//end
                            //MARK:- claimStatus object set in model
                            if let claimstat = resp["claimStatus"] as? Dictionary<String,Any>{
                                self.claimstatus.claimId = claimstat["claimId"] as? Int ?? 0
                                self.claimstatus.patient = claimstat["patient"] as? String ?? ""
                                self.claimstatus.patientId = claimstat["patientId"] as? Int ?? 0
                                self.claimstatus.dos = claimstat["dos"] as? String ?? ""
                                self.claimstatus.priStatus = claimstat["priStatus"] as? String ?? ""
                                self.claimstatus.secStatus = claimstat["secStatus"] as? String ?? ""
                                self.claimstatus.patStatus = claimstat["patStatus"] as? String ?? ""
                                self.claimstatus.priInsurance = claimstat["priInsurance"] as? String ?? ""
                            }// end
                            var priinsurance = [primaryInsurance]()
                            let priins = primaryInsurance()
                            //MARK:- claimInfo set in model
                            if let claimInfomain = resp["claimInfo"] as? Dictionary<String,Any>{
                                self.claiminfo.claimId = claimInfomain["claimId"] as? Int ?? 0
                                self.claiminfo.primaryStatus = claimInfomain["primaryStatus"] as? String ?? ""
                                self.claiminfo.dos = claimInfomain["dos"] as? String ?? ""
                                
                                guard let pinsurance = claimInfomain["primaryInsurances"] as? [Dictionary<String,Any>] else{return}
                                pinsurance.forEach { (data) in
                                    priins.insuranceId = data["insuranceId"] as? Int ?? 0
                                    priins.primaryInsurance = data["primaryInsurance"] as? String ?? ""
                                    priins.policyNumber = data["policyNumber"] as? String ?? ""
                                    priinsurance.append(priins)
                                }
                                self.claiminfo.primary = priinsurance
                                
                                let secinsurance = [secondaryInsurance]()
                                let secins = secondaryInsurance()
                                
                                guard let sinsurance = claimInfomain["secondaryInsurances"] as? [Dictionary<String,Any>] else{return}
                                sinsurance.forEach { (data) in
                                    secins.insuranceId = data["insuranceId"] as? Int ?? 0
                                    secins.secondaryInsurance = data["secondaryInsurance"] as? String ?? ""
                                    secins.policyNumber = data["policyNumber"] as? String ?? ""
                                }
                                self.claiminfo.secondary = secinsurance
                            }// end of claimInfo
                            DispatchQueue.main.async {
                                self.vc?.tableView.reloadData()
                            }
                        }
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }else{
            print("not connected")
        }
    }
}
