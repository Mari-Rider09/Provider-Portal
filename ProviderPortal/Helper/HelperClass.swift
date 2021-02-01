//
//  HelperClass.swift
//  TapNGo Driver
//
//  Created by Spextrum on 07/10/17.
//  Copyright © 2017 nPlus. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
//import Alamofire
var globalToken = String()
var patientId = Int()
var practiceId = Int()
var vSpinner : UIView?
let headers: HTTPHeaders = [
  "Authorization" : "Bearer " + globalToken,
  "Accept": "application/json"
]
class HelperClass: NSObject
{
    static let shared = HelperClass()
    
    
    private override init() {
        super.init()
    }
    
    static let BASEURL = "http://providerapi.maxremind.biz/api"
    // Other URL Suffixes
    static let Header = ["Accept":"application/json"]
    
    
    static let LoginURL = "/Account"
    static let PatientListURl = "/Patient/Filter"
    static let patientDemographic = "/Patient"
    static let patientClaim = "/Patient"
    static let claimDetail = "/Claim"
    static let patientDocument = "/Patient"
    static let patientInsurance = "/Patient"
    static let getInsurance = "/Insurance/GetAllInsuranceHaveClaims"
    static let getSubmissionStatus = "/Claim/GetAllSubmissionStatus"
    static let getPTLReason = "/Claim/PTL"
}
//
extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    func dropShadow2(){
        layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 1
    }
    func dropShadow5() {
        layer.shadowColor = #colorLiteral(red: 0.1729060914, green: 0.1729060914, blue: 0.1729060914, alpha: 1)
        layer.shadowOpacity = 3
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 3
    }
    func dropShado1(){
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 1
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// function is used for alerts
extension UIViewController
{
    func showAlert(_ title :String , message: String)
    {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let titleFont = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        let messageFont = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
        let titleAttrString = NSAttributedString(string: title, attributes: titleFont)
        let messageAttrString = NSAttributedString(string: message, attributes: messageFont)
        alert.setValue(titleAttrString, forKey: "attributedTitle")
        alert.setValue(messageAttrString, forKey: "attributedMessage")
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}

// for loading indicator view
extension UITableView{
    
    func indicatorView() -> UIActivityIndicatorView{
        var activityIndicatorView = UIActivityIndicatorView()
        if self.tableFooterView == nil{
            let indicatorFrame = CGRect(x: 0, y: 0, width: self.bounds.width, height: 40)
            activityIndicatorView = UIActivityIndicatorView(frame: indicatorFrame)
            activityIndicatorView.isHidden = false
            activityIndicatorView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
            activityIndicatorView.isHidden = true
            self.tableFooterView = activityIndicatorView
            return activityIndicatorView
        }else{
            return activityIndicatorView
        }
    }
    func addLoading(_ indexPath:IndexPath, closure: @escaping (() -> Void)){
        indicatorView().startAnimating()
        if let lastVisibleIndexPath = self.indexPathsForVisibleRows?.last {
            if indexPath == lastVisibleIndexPath && indexPath.row == self.numberOfRows(inSection: 0) - 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    closure()
                }
            }
        }
        indicatorView().isHidden = false
    }
    func stopLoading(){
        indicatorView().stopAnimating()
        indicatorView().isHidden = true
    }
}
extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
