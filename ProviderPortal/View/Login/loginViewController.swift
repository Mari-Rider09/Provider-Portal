//
//  loginViewController.swift
//  ProviderPortal
//
//  Created by Apple on 23/09/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import TextFieldEffects
import Alamofire

class loginViewController: UIViewController,UITextFieldDelegate {
    
    var usermodel = UserViewModel()
    
    @IBOutlet weak var eyeBtn: UIButton!
    @IBOutlet weak var txtUserName: HoshiTextField!
    @IBOutlet weak var txtPassword: HoshiTextField!
    
    override func viewDidLoad() {
        usermodel.vc = self
        self.hideKeyboardWhenTappedAround()
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: txtUserName.frame.height - 1, width: txtUserName.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        txtUserName.borderStyle = UITextField.BorderStyle.none
        txtUserName.layer.addSublayer(bottomLine)
        txtPassword.delegate = self
        txtUserName.delegate = self
        txtPassword.text = "12345"
        txtUserName.text = "Admin1"
    }
    var check = true
    @IBAction func btnEye(_ sender: Any) {
        if check == true {
            txtPassword.isSecureTextEntry.toggle()
            eyeBtn.isSelected = false
            check = false
        }
        else{
            txtPassword.isSecureTextEntry.toggle()
            eyeBtn.isSelected = true
            check = true
        }
    }
    @IBAction func btnLogin(_ sender: Any) {
        
        if(self.txtUserName.text == "")
        {
            self.showAlert("Alert", message: "Please Enter your Registered Email ID")
        }
        else if(self.txtPassword.text == "")
        {
            self.showAlert("Alert", message: "Please Enter your Password")
        }
        else
        {
            //            ANLoader.showLoading()
            self.showSpinner(onView: self.view)
            usermodel.loginApi(userName: self.txtUserName.text!, password: self.txtPassword.text!)
            //            ANLoader.hide()
            //            self.removeSpinn´®®er()
        }
    }
}
extension loginViewController{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == txtPassword{
            txtPassword.placeholder = ""
        }
        else if textField == txtUserName{
            txtUserName.placeholder = ""
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == txtPassword{
            if txtPassword.text?.count != 0{
                txtPassword.placeholder = ""
            }else{
                txtPassword.placeholder = "Password"
            }
        }else if textField == txtUserName{
            if txtUserName.text?.count != 0{
                txtUserName.placeholder = ""
            }else{
                txtUserName.placeholder = "Username"
            }
        }
    }
}



