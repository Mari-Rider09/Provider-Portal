//
//  patientDocumentsViewModel.swift
//  ProviderPortal
//
//  Created by Apple on 09/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import Alamofire

class patientDocumentViewModel{
    
    var documentModelArray = [patientDocumentModel]()
    var vc: documentViewController?
    
    func getPatientDocuments() {
        let url = HelperClass.BASEURL + HelperClass.patientDocument + "/\(patientId)" + "/Documents/Filter"
        
        let para: Parameters = [
            "patientId":patientId,
            "Rows":50,
            "PageNumber":0,
            "SortBy":"DocumentName ASC"
        ]
        AF.request(url, method: .post, parameters: para,encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            if ConnectionCheck.isConnectedToNetwork(){
                switch response.result {
                case .success(_):
                    if response.response?.statusCode == 200{
                        if response.value != nil{
                            guard let resp = response.value as? Dictionary<String,Any> else{return}
                            guard let List = resp["documents"] as? [Dictionary<String,Any>] else{return}
                            List.forEach { (data) in
                                let date = data["documentDate"] as? String ?? ""
                                let document = data["documentName"] as? String ?? ""
                                let dType = data["categoryName"] as? String ?? ""
                                let provider = data["providerName"] as? String ?? ""
                                
                                let dList = patientDocumentModel(documentDate: date, documentName: document, categoryName: dType, providerName: provider)
                                self.documentModelArray.append(dList)
                                
                                DispatchQueue.main.async {
                                    self.vc?.tableView.reloadData()
                                }
                            }
                            
                        }
                    }
                case .failure( _):
                    self.vc?.showAlert("Error", message: "Server is not Accessible")
                }
            }else{
                self.vc?.showAlert("Error", message: "check your internet connection")
            }
        }
    }
}
