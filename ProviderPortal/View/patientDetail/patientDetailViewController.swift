//
// patientDetailViewController.swift
// ProviderPortal
//
// Created by Apple on 29/09/2020.
// Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class patientDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    // MARK: - variable
    var patientInfo = ["Demographic","Insurance","Claim","Documents","Patient Payments"]
    var patientInfoImages = ["demographic","insurance","blueClaim","document","payment"]
    var info = String()
    var acNumber = Int()
    var name = String()
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var labelFullName: UILabel!
    @IBOutlet var labelAccountNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Patient Details"
        labelFullName.text = name
        labelAccountNumber.text = "A/C#  " + String(acNumber)
        tableView.tableFooterView = UIView()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patientInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! patientDetailTableViewCell
        cell.patientDetailImage.image = UIImage(named: patientInfoImages[indexPath.row])
        cell.patientDetailLabel.text = patientInfo[indexPath.row]
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_: )))
        cell.patientDetailCellBackView.tag = indexPath.row
        cell.patientDetailCellBackView.addGestureRecognizer(tap)
        return cell
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        if sender?.view?.tag == 0{
            let storyboard = UIStoryboard(name: "Patient", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "demographicViewController") as! demographicViewController
            self.navigationController?.pushViewController(vc, animated: false)
            
        }else if sender?.view?.tag == 1{
            let storyboard = UIStoryboard(name: "Patient", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "insuranceInformationViewController") as! insuranceInformationViewController
            self.navigationController?.pushViewController(vc, animated: false)
        }else if sender?.view?.tag == 2{
            let storyboard = UIStoryboard(name: "Patient", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "claimViewController") as! claimViewController
            self.navigationController?.pushViewController(vc, animated: false)
        }else if sender?.view?.tag == 3{
            let storyboard = UIStoryboard(name: "Patient", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "documentViewController") as! documentViewController
            self.navigationController?.pushViewController(vc, animated: false)
        }
        else if sender?.view?.tag == 4{
            let storyboard = UIStoryboard(name: "Patient", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "PatientPaymentViewController") as! PatientPaymentViewController
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
