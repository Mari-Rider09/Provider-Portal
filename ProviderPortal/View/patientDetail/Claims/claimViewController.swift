//
//  claimViewController.swift
//  ProviderPortal
//
//  Created by Apple on 16/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import Alamofire
class claimViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,OptionButtonsDelegate{
    func btnHideShowClick(cell: claimTableViewCell) {
        if let cell1 = tableView.cellForRow(at: cell.indexPath) as? claimTableViewCell {
            UIView.animate(withDuration: 0.3) {
                cell1.hideShowView.isHidden = !cell1.hideShowView.isHidden
                if cell1.heightView.constant == 247
                {
                    cell1.btnhideShow.isSelected = false
                    cell1.heightView.constant = 120
                }
                else if cell1.heightView.constant == 120
                {
                    cell1.btnhideShow.isSelected = true
                    cell1.heightView.constant = 247
                }
            }
            tableView.beginUpdates()
            tableView.endUpdates()
            tableView.deselectRow(at: cell.indexPath, animated: true)
        }
    }
    var claimNumber = ""
    var param = Parameters()
    
    
    var c = 0
    var claimModel = patientClaimViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
        self.showSpinner(onView: self.view)
        tableView.tableFooterView = UIView()
        navigationItem.title = "Claim"
        claimModel.vc = self
        param = [
            "patientId": patientId,
            "PracticeId":1000,
            "Rows":10,
            "PageNumber":c
        ]
        claimModel.getPatientClaim(pn: c, param: param)
    }
    
    @IBAction func btnFilter(_ sender: Any) {
        guard let popupVC = storyboard?.instantiateViewController(withIdentifier: "ClaimFilterViewController") as? ClaimFilterViewController else { return }
        popupVC.completion = { param in
            self.param = param
            self.claimModel.getPatientClaim(pn: 0, param: param)
            
        }
        popupVC.height = 480
        popupVC.topCornerRadius = 25
        popupVC.presentDuration = 1
        popupVC.dismissDuration = 1
        present(popupVC, animated: false, completion: nil)
    }
}

extension claimViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if claimModel.patientclaim.count != 0{
            self.tableView.isHidden = false
            self.removeSpinner()
        }
        return claimModel.patientclaim.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! claimTableViewCell
        cell.claimIdLabel.text = String(claimModel.patientclaim[indexPath.row].claimId)
        cell.dosLabel.text = claimModel.patientclaim[indexPath.row].dos
        cell.insuranceLabel.text = claimModel.patientclaim[indexPath.row].name
        cell.totalChargesLabel.text = String(claimModel.patientclaim[indexPath.row].claimTotal)
        cell.amountPaidLabel.text = String(claimModel.patientclaim[indexPath.row].amountPaid)
        cell.adjustedLabel.text = String(claimModel.patientclaim[indexPath.row].adjustment)
        cell.balanceDueLabel.text = String(claimModel.patientclaim[indexPath.row].amountDue)
        cell.submissionStatusLabel.text = claimModel.patientclaim[indexPath.row].submissionStatus
        cell.ptlReasonLabel.text = claimModel.patientclaim[indexPath.row].ptlReasons
        cell.btnClaimView.addTarget(self, action: #selector(viewDetail), for: .touchUpInside)
        cell.btnClaimView.tag = indexPath.row
        cell.delegate = self
        cell.indexPath = indexPath
        cell.heightView.constant = 120
        cell.hideShowView.isHidden = true
        return cell
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        tableView.addLoading(indexPath) {
//            self.c = self.c + 1
//            self.claimModel.vc = self
//            self.claimModel.getPatientClaim(pn: self.c, param: self.param)
//            tableView.stopLoading()
//        }
//    }
    @objc func viewDetail(sender: UIButton) {
        let indexpath = sender.tag
        let claimId = claimModel.patientclaim[indexpath].claimId
        let vc = storyboard?.instantiateViewController(withIdentifier: "claimDetailViewController") as! claimDetailViewController
        vc.claimId = claimId
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
