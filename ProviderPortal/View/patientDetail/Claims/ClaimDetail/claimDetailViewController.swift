//
// claimDetailViewController.swift
// ProviderPortal
//
// Created by Hamza Ishaq on 12/11/2020.
// Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class claimDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var pclaimdetailmodel = patientClaimDetailViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    var claimId = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pclaimdetailmodel.vc = self
        pclaimdetailmodel.getPatientClaimDetail(claimid: claimId)
        
    }
    
}

extension claimDetailViewController{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 3
        }
        else if section == 1{
            return pclaimdetailmodel.dxCodeValue.count + 2
        }
        else if section == 2{
            return pclaimdetailmodel.paymentsumarryArray.count + 1
        }
        else if section == 3{
            return pclaimdetailmodel.paymentdetailArray.count + 1
        }
        else if section == 4{
            return pclaimdetailmodel.claimnotesArray.count + 2
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath)as! claimDetailInfoTableViewCell
            if indexPath.row == 0{
                cell.labelInfoName.text = "Patient Info"
                cell.labelOneH.text = "Patient Name"
                cell.labelOneD.text = pclaimdetailmodel.patientinfo.firstName
                cell.labelTwoH.text = "Gender"
                cell.labelTwoD.text = pclaimdetailmodel.patientinfo.gender
                cell.labelThreeH.text = "Date of Birth"
                cell.labelThreeD.text = pclaimdetailmodel.patientinfo.dob
                cell.labelFourH.text = "Address"
                cell.labelFourD.text = pclaimdetailmodel.patientinfo.address
                cell.labelFifthH.text = "Service Location"
                cell.labelFifthD.text = pclaimdetailmodel.patientinfo.state
                cell.labelSixH.text = "Admission Date"
                cell.labelSixD.text = pclaimdetailmodel.claimDetailModel.addmissionDate
                cell.labelSevenH.text = "Discharge Date"
                cell.labelSevenD.text = pclaimdetailmodel.claimDetailModel.dischargeDate
                cell.labelEightH.text = ""
                cell.labelEightD.text = ""
            }
            else if indexPath.row == 1{
                
                cell.labelInfoName.text = "Claim Info"
                cell.labelOneH.text = "Claim Id"
                cell.labelOneD.text = String(pclaimdetailmodel.claiminfo.claimId)
                cell.labelTwoH.text = "Status"
                cell.labelTwoD.text = pclaimdetailmodel.claiminfo.primaryStatus
                cell.labelThreeH.text = "DOS"
                cell.labelThreeD.text = pclaimdetailmodel.claiminfo.dos
                cell.labelFourH.text = ""
                cell.labelFourD.text = ""
                cell.labelFifthH.text = "Primary"
//                cell.labelFifthD.text = pclaimdetailmodel.claiminfo.primary[0].primaryInsurance
                cell.labelSixH.text = ""
                cell.labelSixD.text = ""
                cell.labelSevenH.text = "Secondary"
//                cell.labelSevenD.text = pclaimdetailmodel.claiminfo.secondary[0].secondaryInsurance
                cell.labelEightH.text = ""
                cell.labelEightD.text = ""
            }
            else if indexPath.row == 2{
                cell.labelOneD.text = String(pclaimdetailmodel.paymentinfo.totalCharges)
                
                cell.labelTwoD.text = String(pclaimdetailmodel.paymentinfo.totalPayment)
                
                cell.labelThreeD.text = String(pclaimdetailmodel.paymentinfo.primaryPaid)
                
                cell.labelFourD.text = String(pclaimdetailmodel.paymentinfo.secondaryPaid)
                
                cell.labelFifthD.text = String(pclaimdetailmodel.paymentinfo.otherPaid)
                
                cell.labelSixD.text = String(pclaimdetailmodel.paymentinfo.patientPaid)
                
                cell.labelSevenD.text = String(pclaimdetailmodel.paymentinfo.balanceDue)
                
                cell.labelEightD.text = String(pclaimdetailmodel.paymentinfo.adjusted)
            }
            return cell
        }
        else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DX", for: indexPath) as! CodesNotesTableViewCell
            if indexPath.row == 0{
                cell.labelDX.isHidden = false
                cell.mainView.isHidden = true
                cell.mainViewDX.isHidden = false
            }
            else if indexPath.row == 1{
                cell.labelDX.isHidden = true
                cell.mainView.isHidden = false
                cell.mainViewDX.isHidden = true
                cell.labelNumber.text = "#"
                cell.labelCode.text = "Code"
                cell.labelDiagnosis.text = "Diagnosis"
                cell.mainView.backgroundColor = #colorLiteral(red: 0.1655499637, green: 0.2929365039, blue: 0.5646116138, alpha: 1)
            }
            else{
                tableView.separatorInset.left = 15
                tableView.separatorInset.right = 15
                cell.labelDX.isHidden = true
                cell.mainViewDX.isHidden = true
                cell.mainView.isHidden = false
                cell.labelNumber.text = String(indexPath.row - 2)
                cell.labelCode.text = pclaimdetailmodel.dxCodeValue[indexPath.row - 2]
                cell.labelDiagnosis.text = pclaimdetailmodel.dxCodeDescription[indexPath.row - 2]
                cell.labelNumber.textColor = .black
                cell.labelCode.textColor = .black
                cell.labelDiagnosis.textColor = .black
                cell.mainView.backgroundColor = .white
                
            }
            return cell
        }
        else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PS", for: indexPath) as! SummaryDetailTableViewCell
            let index = indexPath.row - 1
            cell.labelHeading.text = "Payment Summary"
            if indexPath.row == 0{
                cell.viewLabel.isHidden = false
                cell.viewMain.isHidden = true
                cell.viewMainTop.isActive = false
                cell.viewLabelBottom.isActive = true
                cell.viewLabelBottom.constant = 4
                
            }
            else{
                cell.viewLabel.isHidden = true
                cell.viewMain.isHidden = false
                cell.viewMainTop.isActive = true
                cell.viewLabelBottom.isActive = false
                cell.viewMainTop.constant = 4
                cell.labelInfoNumber.text = "#" + String(indexPath.row)
                cell.labelOneD.text = pclaimdetailmodel.paymentsumarryArray[index].cpTdescription
                cell.labelTwoD.text = String(pclaimdetailmodel.paymentsumarryArray[index].totalCharges)
                cell.labelThreeD.text = ""
                cell.labelFourD.text = pclaimdetailmodel.paymentsumarryArray[index].totalCharges
                cell.labelFifthD.text = pclaimdetailmodel.paymentsumarryArray[index].dos
                cell.labelSixD.text = pclaimdetailmodel.paymentsumarryArray[index].allowedAmount
                cell.labelSevenD.text = pclaimdetailmodel.paymentsumarryArray[index].paidAmount
                cell.labelEightD.text = ""
                cell.labelNineD.text = ""
                cell.labelTenD.text = ""
                
            }
            return cell
        }
        else if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PS", for: indexPath) as! SummaryDetailTableViewCell
            let index = indexPath.row - 1
            cell.labelHeading.text = "Payment Detail"
            if indexPath.row == 0{
                cell.viewLabel.isHidden = false
                cell.viewMain.isHidden = true
                cell.viewMainTop.isActive = false
                cell.viewLabelBottom.isActive = true
                cell.viewLabelBottom.constant = 4
                
            }
            else{
                cell.viewLabel.isHidden = true
                cell.viewMain.isHidden = false
                cell.viewMainTop.isActive = true
                cell.viewLabelBottom.isActive = false
                cell.viewMainTop.constant = 4
                cell.labelInfoNumber.text = "#" + String(indexPath.row)
                cell.labelOneH.text = "Service"
                cell.labelOneD.text = pclaimdetailmodel.paymentdetailArray[index].cpTdescription
                cell.labelTwoH.text = "Charges"
                cell.labelTwoD.text = String(pclaimdetailmodel.paymentdetailArray[index].totalCharges)
                cell.labelThreeH.text = "Payment Source"
                cell.labelThreeD.text = ""
                cell.labelFourH.text = "Check #"
                cell.labelFourD.text = String(pclaimdetailmodel.paymentdetailArray[index].checkNumber)
                cell.labelFifthH.text = "Check Date"
                cell.labelFifthD.text = String(pclaimdetailmodel.paymentdetailArray[index].checkDate)
                cell.labelSixH.text = "Allowed Amount"
                cell.labelSixD.text = String(pclaimdetailmodel.paymentdetailArray[index].allowedAmount)
                cell.labelSevenH.text = "Paid Amount"
                cell.labelSevenD.text = String(pclaimdetailmodel.paymentdetailArray[index].paidAmount)
//                cell.labelEightH.text = "Co-Pay Amount"
//                cell.labelEightD.text = ""
//                cell.labelNineH.text = "Co-Ins Amount"
//                cell.labelNineD.text = ""
//                cell.labelTenH.text = "Co-Pay Amount"
//                cell.labelTenD.text = ""
            }
            return cell
        }
        else if indexPath.section == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DX", for: indexPath) as! CodesNotesTableViewCell
            if indexPath.row == 0{
                cell.labelDX.isHidden = false
                cell.labelDX.text = "Claim Notes"
                cell.mainView.isHidden = true
                cell.mainViewDX.isHidden = false
            }
            else if indexPath.row == 1{
                cell.labelDX.isHidden = true
                cell.mainView.isHidden = false
                cell.mainViewDX.isHidden = true
                cell.labelNumber.text = "Date"
                cell.labelCode.text = "Category"
                cell.labelDiagnosis.text = "Notes"
                cell.mainView.backgroundColor = #colorLiteral(red: 0.1655499637, green: 0.2929365039, blue: 0.5646116138, alpha: 1)
            }
            else{
                cell.labelDX.isHidden = true
                cell.mainViewDX.isHidden = true
                cell.mainView.isHidden = false
                tableView.separatorInset.left = 15
                tableView.separatorInset.right = 15
                cell.labelNumber.text = pclaimdetailmodel.claimnotesArray[indexPath.row - 2].noteDate
                cell.labelCode.text = pclaimdetailmodel.claimnotesArray[indexPath.row - 2].categoryName
                cell.labelDiagnosis.text = pclaimdetailmodel.claimnotesArray[indexPath.row - 2].notes
                cell.labelNumber.textColor = .black
                cell.labelCode.textColor = .black
                cell.labelDiagnosis.textColor = .black
                cell.mainView.backgroundColor = .white
                
            }
            return cell
        }
        return UITableViewCell()
    }
}
