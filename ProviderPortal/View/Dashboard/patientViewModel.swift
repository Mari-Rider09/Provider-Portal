//
//  patientViewModel.swift
//  ProviderPortal
//
//  Created by Apple on 04/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

//import Foundation
//import Alamofire
//class patientViewModel{
//
//    var patientmodel = patientsModel()
//    var patientmodelArray = [patientsModel]()
//    var vc: patientViewController?
//
//    func getPatients(pn : Int,firstName:String,lastName: String,gender: String) {
//        let url = HelperClass.BASEURL + HelperClass.PatientListURl
//        let para: Parameters = [
//            "PracticeId":1000,
//            "Rows":10,
//            "PageNumber":pn,
//            "FirstName": firstName,
//            "LastName": lastName,
//            "Gender": gender
//        ]
//        AF.request(url, method: .post, parameters: para, encoding: JSONEncoding.default,headers: headers).responseJSON{ response in
//            if pn == 0 {
//                self.patientmodelArray.removeAll()
//            }
//
//            if ConnectionCheck.isConnectedToNetwork(){
//                switch response.result{
//
//                case .success(_):
//
//                    guard let resp = response.value as? Dictionary<String,Any> else{return}
//
//                    guard let List = resp["patientList"] as? [Dictionary<String,Any>] else{return}
//                    List.forEach{ (data) in
//
//                        let rnum = data["rowNumber"] as? Int ?? 0
//                        let pId = data["patientId"] as? Int ?? 0
//                        let lname = data["lastName"] as? String ?? ""
//                        let fname = data["firstName"] as? String ?? ""
//                        let fullname = data["fullName"] as? String ?? ""
//                        let dob = data["dateOfBirth"] as? String ?? ""
//                        let mstatus = data["maritalStatus"] as? String ?? ""
//                        let gender = data["gender"] as? String ?? ""
//                        let address = data["address"] as? String ?? ""
//                        let name = data["name"] as? String ?? ""
//                        let adrstype = data["addressType"] as? String ?? ""
//                        let city = data["city"] as? String ?? ""
//                        let state = data["state"] as? String ?? ""
//                        let zip = data["zip"] as? String ?? ""
//                        let isactive = data["isActive"] as? Bool ?? false
//                        let isptl = data["isPTL"] as? Bool ?? false
//                        let cell = data["cell"] as? String ?? ""
//
//                        let pList = patientsModel(rowNumber: rnum,
//                                                  patientId: pId, lastName: lname, firstName: fname, fullName: fullname, dateOfBirth: dob, martialStatus: mstatus, gender: gender, address: address, name: name, addressType: adrstype, city: city, state: state, zip: zip, isActive: isactive, isPTL: isptl,cell: cell)
//
//                        self.patientmodelArray.append(pList)
//                        ////                      chiefComplaints.append(complaints)
//                    }
//                    DispatchQueue.main.async {
//
//                        self.vc?.tableView.reloadData()
//                    }
//                case .failure(let error):
//                    print("Error==",error)
//                }
//            }else{
//                self.vc?.showAlert("Error 404!", message: "user not found")
//            }
//        }
//    }
//
//}
import Foundation
import Alamofire
class patientViewModel{
    
    var patientmodel = patientsModel()
    var patientmodelArray = [patientsModel]()
    var vc: patientViewController?
    
    func getPatients(pn : Int,Parm: Parameters) {
        let url = HelperClass.BASEURL + HelperClass.PatientListURl
        AF.request(url, method: .post, parameters: Parm, encoding: JSONEncoding.default,headers: headers).responseJSON{ response in
            if pn == 0 {
                self.patientmodelArray.removeAll()
            }
            
            if ConnectionCheck.isConnectedToNetwork(){
                switch response.result{
                    
                case .success(_):
                    
                    guard let resp = response.value as? Dictionary<String,Any> else{return}
                    
                    guard let List = resp["patientList"] as? [Dictionary<String,Any>] else{return}
                    List.forEach{ (data) in
                        
                        let rnum = data["rowNumber"] as? Int ?? 0
                        let pId = data["patientId"] as? Int ?? 0
                        let lname = data["lastName"] as? String ?? ""
                        let fname = data["firstName"] as? String ?? ""
                        let fullname = data["fullName"] as? String ?? ""
                        let dob = data["dateOfBirth"] as? String ?? ""
                        let mstatus = data["maritalStatus"] as? String ?? ""
                        let gender = data["gender"] as? String ?? ""
                        let address = data["address"] as? String ?? ""
                        let name = data["name"] as? String ?? ""
                        let adrstype = data["addressType"] as? String ?? ""
                        let city = data["city"] as? String ?? ""
                        let state = data["state"] as? String ?? ""
                        let zip = data["zip"] as? String ?? ""
                        let isactive = data["isActive"] as? Bool ?? false
                        let isptl = data["isPTL"] as? Bool ?? false
                        let cell = data["cell"] as? String ?? ""
                        
                        let pList = patientsModel(rowNumber: rnum,
                                                  patientId: pId, lastName: lname, firstName: fname, fullName: fullname, dateOfBirth: dob, martialStatus: mstatus, gender: gender, address: address, name: name, addressType: adrstype, city: city, state: state, zip: zip, isActive: isactive, isPTL: isptl,cell: cell)
                        
                        self.patientmodelArray.append(pList)
                        ////                      chiefComplaints.append(complaints)
                    }
                    DispatchQueue.main.async {
                        self.vc?.removeSpinner()
                        self.vc?.tableView.isHidden = false
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
