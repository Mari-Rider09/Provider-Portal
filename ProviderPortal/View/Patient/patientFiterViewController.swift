//
//  patientFiterViewController.swift
//  ProviderPortal
//
//  Created by Apple on 09/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import iOSDropDown
import BottomPopup
import Alamofire

class patientFiterViewController: BottomPopupViewController {
    
    var height: CGFloat?
    var topCornerRadius: CGFloat?
    var presentDuration: Double?
    var dismissDuration: Double?
    var shouldDismissInteractivelty: Bool?
    
    typealias completionHandler = ([String: Any]) -> Void
    var completion: completionHandler?
    
    @IBOutlet weak var txtAccountNo: UITextField!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var genderDropDown: DropDown!
    @IBOutlet weak var txtDOB: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPriInsurance: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    
    var patientfilter = pFilterPriInsuranceViewModel()
    var genderArray = ["","Male","Female"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // for hide keyboard
        genderDropDown.inputView = UIView()
        txtPhone.inputView = UIView()
        patientfilter.vc = self
        patientfilter.getSubmissionStatus()
        genderDropDown.optionArray = genderArray
    }
    
    override var popupHeight: CGFloat { return height ?? CGFloat(300) }
    
    override var popupTopCornerRadius: CGFloat { return topCornerRadius ?? CGFloat(10) }
    
    override var popupPresentDuration: Double { return presentDuration ?? 5.0 }
    
    override var popupDismissDuration: Double { return dismissDuration ?? 1.0 }
    
    override var popupShouldDismissInteractivelty: Bool { return shouldDismissInteractivelty ?? true }
    
    @IBAction func btnApply(_ sender: Any) {
        var param = Parameters()
        var acNumber: Int?
        let fname = self.txtFirstName.text
        let lname = self.txtLastName.text
        let gender = self.genderDropDown.text
        acNumber = Int(self.txtAccountNo.text!)
        let dob = self.txtDOB.text
        let phone = self.txtPhone.text
        let priInsurence = self.txtPriInsurance.text
        let address = self.txtAddress.text
        param = [
            "PracticeId":1000,
            "Rows":10,
            "PageNumber":0,
            "FirstName": fname ?? "",
            "LastName": lname ?? "",
            "Gender": gender ?? "",
            "patientId": acNumber as Any,
            "PriInsurance": priInsurence ?? "",
            "Phone": phone ?? "",
            "Address": address ?? ""
        ]
        
        guard let competionBlock = completion else{return}
        competionBlock(param as [String : Any])
        dismiss(animated: true, completion: nil)
    }
}


