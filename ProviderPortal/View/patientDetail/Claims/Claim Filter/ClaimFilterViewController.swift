//
//  ClaimFilterViewController.swift
//  ProviderPortal
//
//  Created by Hamza Ishaq on 25/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import iOSDropDown
import BottomPopup
import Alamofire

class ClaimFilterViewController: BottomPopupViewController {
    @IBOutlet var priInsuranceDropDown: DropDown!
    @IBOutlet var submissionStatusDropDown: DropDown!
    @IBOutlet var ptlReasonDropDown: DropDown!
    @IBOutlet var txtClaimNo: UITextField!
    @IBOutlet var txtDOS: UITextField!
    @IBOutlet var txtTotalCharges: UITextField!
    @IBOutlet var txtAmountPaid: DropDown!
    @IBOutlet var txtAdjusted: UITextField!
    @IBOutlet var txtBalanceDue: UITextField!
    
    
    
    
    var height: CGFloat?
    var topCornerRadius: CGFloat?
    var presentDuration: Double?
    var dismissDuration: Double?
    var shouldDismissInteractivelty: Bool?
    var patientfilter = pFilterPriInsuranceViewModel()
    
    typealias completionHandler = ([String: Any]) -> Void
    var completion: completionHandler?
    var priInsId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        patientfilter.vc1 = self
        patientfilter.getPriInsurance()
        patientfilter.getSubmissionStatus()
        patientfilter.getPTLReason()
        
        priInsuranceDropDown.inputView = UIView()
        submissionStatusDropDown.inputView = UIView()
        ptlReasonDropDown.inputView = UIView()
        
    }
    override var popupHeight: CGFloat { return height ?? CGFloat(300) }
    
    override var popupTopCornerRadius: CGFloat { return topCornerRadius ?? CGFloat(10) }
    
    override var popupPresentDuration: Double { return presentDuration ?? 1.0 }
    
    override var popupDismissDuration: Double { return dismissDuration ?? 1.0 }
    
    override var popupShouldDismissInteractivelty: Bool { return shouldDismissInteractivelty ?? true }
    
    @IBAction func priInsuranceDrop(_ sender: Any) {
        let id = priInsuranceDropDown.selectedIndex
        
        priInsId = patientfilter.pFilterPriInsuranceArray[id!].insuranceId
    }
    
    @IBAction func btnApply(_ sender: Any) {
        var claimNo: Int?
        var dos: Date?
        var subStatus: String?
        var priIns: Int?
        var ptlReason: String?
        
        claimNo = Int(txtClaimNo.text!)
        subStatus = String(submissionStatusDropDown.text!)
        priIns = priInsId
        ptlReason = String(ptlReasonDropDown.text!)
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"

        if let date = dateFormatterGet.date(from:txtDOS.text! ) {
            dos = date
            print(dateFormatterPrint.string(from: date))
        } else {
           print("There was an error decoding the string")
        }
        
        var param = Parameters()
            param = [
            "patientId": patientId,
            "PracticeId":1000,
            "Rows":10,
            "PageNumber":0,
            "claimId":claimNo,
            "dos": dos,
            "submissionStatus":subStatus,
            "name": priIns,
            "ptlReasons":ptlReason
            ]
//        }
        
        guard let completionBlock = completion else{return}
        completionBlock(param)
        dismiss(animated: true, completion: nil)
    }
}

