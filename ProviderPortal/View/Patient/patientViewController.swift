//
//  patientViewController.swift
//  ProviderPortal
//
//  Created by Apple on 25/09/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import BottomPopup
import Alamofire

class patientViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
     var patientviewmodel = patientViewModel()
     var param = Parameters()
     var fName = ""
     var lName = ""
     var acNumber: Int?
     var gender = ""
     var dob: Date?
     var phone = ""
     var priinsur = ""
     var adres = ""
     var c = Int()
    
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        apiCall()
        navigationItem .backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func apiCall(){
        
        tableView.isHidden = true
        
        self.showSpinner(onView: self.view)
        patientviewmodel.vc = self
        
        param = [
            "PracticeId":1000,
            "Rows":10,
            "PageNumber": 0,
            "FirstName": fName,
            "LastName": lName,
            "Gender": gender,
            "patientId": acNumber as Any,
            "dateOfBirth": dob as Any,
            "cell": phone,
            "name": priinsur,
            "address": adres
        ]
        patientviewmodel.getPatients(pn: 0, Parm: param)
        
    }
    
    @IBAction func btnFilter(_ sender: Any) {
        param.removeAll()
        guard let popupVC = storyboard?.instantiateViewController(withIdentifier: "patientFiterViewController") as? patientFiterViewController else { return }
        popupVC.completion = { para in
        
            self.tableView.isHidden = true
            self.showSpinner(onView: self.view)
            self.fName = para["FirstName"] as? String ?? ""
            self.lName = para["LastName"] as? String ?? ""
            self.gender = para["Gender"] as? String ?? ""
            self.acNumber = para["patientId"] as? Int
            self.priinsur = para["PriInsurance"] as? String ?? ""
            self.phone = para["Phone"] as? String ?? ""
            self.adres = para["Address"] as? String ?? ""
            self.c = para["PageNumber"] as? Int ?? 0
        
            self.param = para
            self.patientviewmodel.getPatients(pn: 0, Parm: self.param)
            
        }
        popupVC.height = 430
        popupVC.topCornerRadius = 25
        popupVC.presentDuration = 0.5
        popupVC.dismissDuration = 1
        self.navigationController?.present(popupVC, animated: false, completion: nil)
        }
}
extension patientViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return patientviewmodel.patientmodelArray.count
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // need to pass your indexpath then it showing your indicator at bottom
        tableView.addLoading(indexPath) {
            // add your code here
            // append Your array and reload your tableview
            self.c = self.c + 1
            self.param = [
                "PracticeId":1000,
                "Rows":10,
                "PageNumber":self.c,
                "FirstName": self.fName,
                "LastName": self.lName,
                "Gender": self.gender,
                "patientId": self.acNumber as Any,
                "PriInsurance": self.priinsur,
                "Phone": self.phone,
                "Address": self.adres
            ]
            self.patientviewmodel.vc = self
            self.patientviewmodel.getPatients(pn: self.c, Parm: self.param)
            tableView.stopLoading() // stop your indicator
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! patientTableViewCell
        cell.lblACNumber.text = String(patientviewmodel.patientmodelArray[indexPath.row].patientId)
        cell.lblFullName.text = patientviewmodel.patientmodelArray[indexPath.row].fullName
        
        cell.labelDob.text = patientviewmodel.patientmodelArray[indexPath.row].dateOfBirth
        cell.lblGender.text = patientviewmodel.patientmodelArray[indexPath.row].gender
        
        cell.lblserialNumber.text = "#" + String(indexPath.row + 1)
        cell.btnViewDetail.tag = indexPath.row
        cell.btnViewDetail.addTarget(self, action: #selector(cellbtnTapp), for: .touchUpInside)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 127
    }
    
    @objc func cellbtnTapp(sender: UIButton){
        let index = sender.tag
        let storyboard = UIStoryboard(name: "Patient", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "patientDetailViewController")
            as! patientDetailViewController
        vc.acNumber = patientviewmodel.patientmodelArray[index].patientId
        vc.name = patientviewmodel.patientmodelArray[index].fullName
        patientId = patientviewmodel.patientmodelArray[index].patientId
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

