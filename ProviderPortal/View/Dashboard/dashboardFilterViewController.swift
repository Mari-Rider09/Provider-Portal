//
//  dashboardFilterViewController.swift
//  ProviderPortal
//
//  Created by Apple on 07/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import iOSDropDown
import BottomPopup
import Alamofire

var ddlName = ["All"]
var ddlID = [Int]()
var providerName = ["All"]
var providerNameId = [Int]()

class dashboardFilterViewController: BottomPopupViewController,UITextFieldDelegate {
    
    var height: CGFloat?
    var topCornerRadius: CGFloat?
    var presentDuration: Double?
    var dismissDuration: Double?
    var shouldDismissInteractivelty: Bool?
    
    @IBOutlet weak var btnPD: UIButton!
    @IBOutlet weak var btnDOS: UIButton!
    @IBOutlet weak var txtToDate: UITextField!
    @IBOutlet weak var txtFromDate: UITextField!
    @IBOutlet weak var dashBoardFilterView: UIView!
    @IBOutlet weak var dateRange: DropDown!
    @IBOutlet weak var locationDrop: DropDown!
    @IBOutlet weak var billingProviderDrop: DropDown!
    
    
    override var popupHeight: CGFloat { return height ?? CGFloat(300) }
    
    override var popupTopCornerRadius: CGFloat { return topCornerRadius ?? CGFloat(10) }
    
    override var popupPresentDuration: Double { return presentDuration ?? 5.0 }
    
    override var popupDismissDuration: Double { return dismissDuration ?? 1.0 }
    
    override var popupShouldDismissInteractivelty: Bool { return shouldDismissInteractivelty ?? true }
    
    //    override var popupDimmingViewAlpha: CGFloat { return BottomPopupConstants.kDimmingViewDefaultAlphaValue }
    typealias completionHandler = ([String: Any]) -> Void
    var completion: completionHandler?
    
    var dvm = dashBoardViewModel()
    var pLocationId = ""
    var bPhysicianId = ""
    var dosFrom = ""
    var dosTo = ""
    var postDateFrom = ""
    var postDateTo = ""
    
    let dateRangeArray = ["Last 90 Days", "Select Dates", "Month to Date", "Last Month", "Year to Date"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        showLoadingIndicator()
        btnPD.isSelected = true
        txtFromDate.delegate = self
        txtToDate.delegate = self
        txtToDate.isEnabled = false
        txtFromDate.isEnabled = false
        dvm.dashFilterVc = self
        
        // for hide the keyboard when user click on textfield
        dateRange.inputView = UIView()
        locationDrop.inputView = UIView()
        billingProviderDrop.inputView = UIView()
        
        
        dateRange.optionArray = dateRangeArray
        locationDrop.optionArray = ddlName
        billingProviderDrop.optionArray = providerName
        locationDrop.text = ddlName[0]
        billingProviderDrop.text = providerName[0]
        dateRange.text = dateRangeArray[0]
    }
    
    @IBAction func btnDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        txtFromDate.resignFirstResponder()
        txtToDate.resignFirstResponder()
        if textField == txtToDate{
            selectDate(textField: txtToDate)
        }else if textField == txtFromDate{
            selectDate(textField: txtFromDate)
        }
    }
    func selectDate(textField: UITextField){
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.frame = CGRect(x: 0, y: 30, width:view.frame.width/1.3, height: view.frame.height/2.5)
        let now = Date()
        //        if textField == txtToDate{
        //            datePicker.minimumDate = now
        //        }
        datePicker.maximumDate = now
        if textField.text?.count != 0{
            let isoDate = textField.text!
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let date = dateFormatter.date(from:isoDate)!
            datePicker.date = date
        }
        let alert = UIAlertController(title: "Select Date", message: "\n\n\n\n\n\n\n\n\n", preferredStyle: .alert)
        alert.view.addSubview(datePicker)
        let selectAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("Selected Date: \(datePicker.date)")
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yyyy"
            textField.text = formatter.string(from: datePicker.date)
        })
        //        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(selectAction)
        //      alert.addAction(cancelAction)
        
        present(alert, animated: true)
        alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: nil))
        
    }
    
    @IBAction func DosAction(_ sender: Any) {
        if btnDOS.isSelected != true{
            btnDOS.isSelected = true
            btnPD.isSelected = false
        }
    }
    @IBAction func PostDateAction(_ sender: Any) {
        if btnPD.isSelected != true{
            btnPD.isSelected = true
            btnDOS.isSelected = false
        }
    }
    @IBAction func locationDropDown(_ sender: Any) {
        locationDrop.didSelect { (selected, index, id) in
            if index <= 0{
                self.pLocationId = ""
            }else{
                let psid = ddlID[index-1]
                self.pLocationId = String(psid)
            }
        }
    }
    @IBAction func billingProviderDropDown(_ sender: Any) {
        billingProviderDrop.didSelect { (selected, index, id) in
            if index <= 0{
                self.bPhysicianId = ""
            }else{
                let bpid = providerNameId[index-1]
                self.bPhysicianId = String(bpid)
            }
        }
    }
    
    @IBAction func dateRangeDropDown(_ sender: Any) {
        dateRange.didSelect { (selected, index, id) in
            if index == 1{
                self.txtFromDate.isEnabled = true
                self.txtFromDate.backgroundColor = .white
                
                self.txtToDate.isEnabled = true
                self.txtToDate.backgroundColor = .white
            } else if index != 1{
                self.self.txtFromDate.isEnabled = false
                self.self.txtFromDate.text = ""
                self.self.txtFromDate.backgroundColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                
                self.self.txtToDate.isEnabled = false
                self.txtToDate.text = ""
                self.txtToDate.backgroundColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            }
        }
    }
    
    @IBAction func ApplyAction(_ sender: Any) {
        
        if dateRange.text == "Last 90 Days" && btnPD.isSelected == true{
            let result = last90Days()
            let date = result.split(separator: ",")
            postDateFrom = String(date[1])
            postDateTo = String(date[0])
            dashboardDateString = dateRange.text!+" "+"(Post)"+" "+postDateFrom+"-"+postDateTo
            apiCall()
        }else if dateRange.text == "Last 90 Days" && btnDOS.isSelected == true{
            let result = last90Days()
            let date = result.split(separator: ",")
            dosFrom = String(date[1])
            dosTo = String(date[0])
            dashboardDateString = dateRange.text!+" "+"(Dos)"+" "+dosFrom+"-"+dosTo
            apiCall()
        }else if dateRange.text == "Select Dates" && btnPD.isSelected == true{
            
            if txtFromDate.text == "" || txtToDate.text == ""{
                self.showAlert("Alert!", message: "please enter valid date")
            }else if isValidDate(dateString: txtFromDate.text!) == false || isValidDate(dateString: txtToDate.text!) == false{
                self.showAlert("Alert!", message: "please enter valid date")
            }else if isValidDate(dateString: txtFromDate.text!) == true || isValidDate(dateString: txtToDate.text!) == true{
                
                let fdate = txtFromDate.text!
                let tdate = txtToDate.text!
                
                let dateFormatterGet = DateFormatter()
                dateFormatterGet.dateFormat = "MM/dd/yyyy"
                
                let dateFormatterPrint = DateFormatter()
                dateFormatterPrint.dateFormat = "MM/dd/yyyy"
                
                if let date = dateFormatterGet.date(from: fdate){
                    let a = dateFormatterPrint.date(from: fdate)
                    print(a)
                }
                if let date = dateFormatterGet.date(from: tdate){
                    let b = dateFormatterPrint.date(from: tdate)
                }
                let fromdate = dateFormatterPrint.date(from: fdate)
                let todate = dateFormatterPrint.date(from: tdate)
                
                if fromdate == todate{
                    showAlert("Alert!", message: "To Date cannot be less then From Date")
                }else if (fromdate! > todate!){
                    print("from date= ",fromdate)
                }else{
                    let result = txtFromDate.text!+","+txtToDate.text!
                    let date = result.split(separator: ",")
                    postDateFrom = String(date[0])
                    postDateTo = String(date[1])
                    dashboardDateString = dateRange.text!+" "+"(Post)"+" "+postDateFrom+"-"+postDateTo
                    apiCall()
                }
            }
            
        }else if dateRange.text == "Select Dates" && btnDOS.isSelected == true{
            
            if txtFromDate.text == "" || txtToDate.text == ""{
                showAlert("Alert!", message: "please enter valid date")
            }else if isValidDate(dateString: txtFromDate.text!) == false || isValidDate(dateString: txtToDate.text!) == false{
                showAlert("Alert!", message: "please enter valid date")
            }else if isValidDate(dateString: txtFromDate.text!) == true || isValidDate(dateString: txtToDate.text!) == true{
                if txtFromDate.text == txtToDate.text{
                    showAlert("Alert!", message: "To Date cannot be less then From Date")
                }else{
                    let result = startDateOfCurrentYear()
                    let date = result.split(separator: ",")
                    dosFrom = String(date[0])
                    dosTo = String(date[1])
                    dashboardDateString = dateRange.text!+" "+"(Dos)"+" "+dosFrom+"-"+dosTo
                    apiCall()
                }
            }
            
        }else if dateRange.text == "Month to Date" && btnPD.isSelected == true{
            
            let result = monthToDate()
            let date = result.split(separator: ",")
            postDateFrom = String(date[1])
            postDateTo = String(date[0])
            dashboardDateString = dateRange.text!+" "+"(Post)"+" "+postDateFrom+"-"+postDateTo
            apiCall()
            
        }else if dateRange.text == "Month to Date" && btnDOS.isSelected == true{
            
            let result = monthToDate()
            let date = result.split(separator: ",")
            dosFrom = String(date[1])
            dosTo = String(date[0])
            dashboardDateString = dateRange.text!+" "+"(Dos)"+" "+dosFrom+"-"+dosTo
            apiCall()
            
        }else if dateRange.text == "Last Month" && btnPD.isSelected == true{
            
            let result = getLastMonth()
            let date = result.split(separator: ",")
            postDateFrom = String(date[0])
            postDateTo = String(date[1])
            dashboardDateString = dateRange.text!+" "+"(Post)"+" "+postDateFrom+"-"+postDateTo
            apiCall()
            
        }else if dateRange.text == "Last Month" && btnDOS.isSelected == true{
            
            let result = getLastMonth()
            let date = result.split(separator: ",")
            dosFrom = String(date[0])
            dosTo = String(date[1])
            dashboardDateString = dateRange.text!+" "+"(Dos)"+" "+dosFrom+"-"+dosTo
            apiCall()
            
        }else if dateRange.text == "Year to Date" && btnPD.isSelected == true{
            
            let result = startDateOfCurrentYear()
            let date = result.split(separator: ",")
            postDateFrom = String(date[0])
            postDateTo = String(date[1])
            dashboardDateString = dateRange.text!+" "+"(Post)"+" "+postDateFrom+"-"+postDateTo
            apiCall()
            
        }else if dateRange.text == "Year to Date" && btnDOS.isSelected == true{
            let result = startDateOfCurrentYear()
            let date = result.split(separator: ",")
            dosFrom = String(date[0])
            dosTo = String(date[1])
            dashboardDateString = dateRange.text!+" "+"(Dos)"+" "+dosFrom+"-"+dosTo
            apiCall()
        }
    }
    
    func apiCall() {
        var param = Parameters()
        param = [
            "PracticeLocationsId": pLocationId,
            "BillingPhysicianId": bPhysicianId,
            "DATEOFSERIVCEFROM": dosFrom,
            "DATEOFSERIVCETO": dosTo,
            "PostDateFrom": postDateFrom,
            "PostDateTo": postDateTo
        ]
        
        guard let completionBlock = completion else{return}
        completionBlock(param)
        dismiss(animated: true, completion: nil)
    }
    
    func last90Days()-> String{
        let today = Date() //Jun 21, 2017, 7:18 PM
        let nintyDaysBeforeToday = Calendar.current.date(byAdding: .day, value: -90, to: today)! //May 22, 2017, 7:18 PM
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MM/dd/yyyy"
        
        let now = dateFormatterPrint.string(from: today)
        let lastninty = dateFormatterPrint.string(from: nintyDaysBeforeToday)
        return now+","+lastninty
    }
    
    func monthToDate() -> String {
        let dateFormatter = DateFormatter()
        let date = Date()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        
        let comp: DateComponents = Calendar.current.dateComponents([.year, .month], from: date)
        let startOfMonth = Calendar.current.date(from: comp)!
        
        let now = dateFormatter.string(from: date)
        let monthStartDate = dateFormatter.string(from: startOfMonth)
        
        return now+","+monthStartDate
    }
    
    func getLastMonth()-> String{
        let last = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        let str = dateFormatTime(date: last!)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let date = dateFormatter.date(from:str)!
        
        
        let comp: DateComponents = Calendar.current.dateComponents([.year, .month], from: date)
        let startOfMonth = Calendar.current.date(from: comp)!
        
        let start = dateFormatter.string(from: startOfMonth)
        var comps2 = DateComponents()
        comps2.month = 1
        comps2.day = -1
        let endOfMonth = Calendar.current.date(byAdding: comps2, to: startOfMonth)
        let end = dateFormatter.string(from: endOfMonth!)
        
        return start + "," + end
    }
    func dateFormatTime(date : Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return dateFormatter.string(from: date)
    }
    
    func startDateOfCurrentYear() -> String{
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "MM-dd-yyyy"
        let nowDate = format.string(from: date)
        
        let calendar = Calendar.current
        let y = calendar.component(.year, from: date)
        let year = String(y)
        var startYear = "01-01"
        startYear = startYear+"-"+year
        
        return startYear+","+nowDate
    }
    
    func isValidDate(dateString: String) -> Bool {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "MM-dd-yyyy"
        if let _ = dateFormatterGet.date(from: dateString) {
            //date parsing succeeded, if you need to do additional logic, replace _ with some variable name i.e date
            return true
        } else {
            // Invalid date
            return false
        }
    }
}

