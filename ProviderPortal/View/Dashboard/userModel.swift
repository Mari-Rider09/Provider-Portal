//
//  userModel.swift
//  ProviderPortal
//
//  Created by Apple on 04/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class UserViewModel: UIViewController{
    
    var loginUser =   loginUserModel()  //model Class object
    weak var vc: loginViewController?   // controller Class object
    
    
    func loginApi(userName: String, password: String) {
        let url = HelperClass.BASEURL + HelperClass.LoginURL + "/\(userName)" + "/\(password)"
        if ConnectionCheck.isConnectedToNetwork(){
            
            guard let url = URL(string: url) else {return}
            
            AF.request(url, method:.get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
                .responseJSON{ responses in
                    if case .failure( _) = responses.result
                    {
                        //                        print(error.localizedDescription)
                        //                        print(error.responseCode!)
                        self.vc?.showAlert("Error", message: "Server is not Accessible")
                        self.removeSpinner()
                    }else if case .success = responses.result
                    {
                        print(responses.value!)
                        print(responses.response?.statusCode as Any)
                        
                        if responses.response?.statusCode == 200{
                            if responses.value != nil{
                                if let arrays = responses.value as? [String: Any]{
                                    self.loginUser.token = arrays["token"] as! String
                                    self.loginUser.userId = arrays["userId"] as! Int
                                    self.loginUser.isActive = arrays["isActive"] as! Bool
                                    self.loginUser.firstName = arrays["firstName"] as! String
                                    self.loginUser.lastName = arrays["lastName"] as! String
                                    self.loginUser.lastName = arrays["middleName"] as! String
                                    self.loginUser.emailAddress = arrays["emailAddress"] as! String
                                    self.loginUser.token = arrays["phoneNumber"] as! String
                                    self.loginUser.serviceProviderId = arrays["serviceProviderId"] as! Int
                                    self.loginUser.practiceId = arrays["practiceId"] as! Int
                                    practiceId = arrays["practiceId"] as! Int
                                    self.loginUser.practiceLocationId = arrays["practiceLocationsId"] as! Int
                                    self.loginUser.profilePicturePath = arrays["profilePicturePath"] as! String
                                    self.loginUser.isImported = arrays["isImported"] as! Bool
                                    self.loginUser.practiceName = arrays["practiceName"] as! String
                                    self.loginUser.practiceLogo = arrays["practiceLogo"] as! String
                                    self.loginUser.address = arrays["address"] as! String
                                    self.loginUser.city = arrays["city"] as! String
                                    self.loginUser.state = arrays["state"] as! String
                                    self.loginUser.zip = arrays["zip"] as! String
                                    self.loginUser.contactPersonPhone = arrays["contactPersonPhone"] as! String
                                    self.loginUser.practiceDeleted = arrays["practiceDeleted"] as! Bool
                                    globalToken = arrays["token"] as! String
                                }
                            }
                            self.vc?.performSegue(withIdentifier: "dashboard", sender: self)
                            
                        }else{
                            
                            self.vc?.showAlert("Error 404!", message: "user not found")
                        }
                    }
            }
        }
        else{
            self.vc?.showAlert("Retry!", message: "Please check your internet connection")
        }
    }
}
