//
//  insuranceInformationViewController.swift
//  ProviderPortal
//
//  Created by Apple on 16/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class insuranceInformationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,HideShowBtnDelegate {
    func btnHideShowClick(cell: insuranceInformationTableViewCell) {
        if let cell1 = tableView.cellForRow(at: cell.indexPath) as? insuranceInformationTableViewCell {
            
            UIView.animate(withDuration: 0.3) {
//                cell1.hideShowView.isHidden = !cell1.hideShowView.isHidden
                if cell1.heightViewConstraint.constant == 312
                {
                    cell1.btnHideShow.isSelected = false
                    cell1.heightViewConstraint.constant = 196
                    cell1.bottomView.isHidden = true
                    
                }
                else if cell1.heightViewConstraint.constant == 196
                {
                    cell1.btnHideShow.isSelected = true
                    cell1.bottomView.isHidden = false
                    cell1.heightViewConstraint.constant = 312
                }
                else if cell1.heightViewConstraint.constant == 155
                {
                    cell1.bottomView.isHidden = false
                    cell1.btnHideShow.isSelected = true
                    cell1.heightViewConstraint.constant = 270
                }
                else if cell1.heightViewConstraint.constant == 270
                {
                    cell1.btnHideShow.isSelected = false
                    cell1.bottomView.isHidden = true
                    cell1.heightViewConstraint.constant = 155
                    
                }
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            tableView.deselectRow(at: cell.indexPath, animated: true)
        }
    }
    
  
    
    var insuranceviewmodel = patientInsuranceViewModel()
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

       navigationItem.title = "Insurance Information"
        self.showSpinner(onView: self.view)
        tableView.isHidden = true
        insuranceviewmodel.vc = self
        insuranceviewmodel.getInsuranceInformation()
    }
  }

extension insuranceInformationViewController{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if insuranceviewmodel.patientPimaryInsurance.count != 0{
            self.tableView.isHidden = false
//            self.removeSpinner()
        }
        if section == 0{
            return insuranceviewmodel.patientPimaryInsurance.count
        }
        else if section == 1{
            return insuranceviewmodel.patientSeondaryInsurance.count
        }
        else if section == 2{
            return insuranceviewmodel.patientOtherInsurance.count
        }
        else if section == 3{
            return insuranceviewmodel.patientTerminatedInsurance.count
        }
        return 0
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! insuranceInformationTableViewCell
            if indexPath.row != 0{
                cell.labelInsuranceType.isHidden = true
                cell.insuranceView.isHidden = true
                cell.topViewConstraintLine.constant = 10
                cell.topViewConstraint.constant = 10
                cell.heightViewConstraint.constant = 155
            }
            else {
                cell.labelInsuranceType.isHidden = false
                cell.insuranceView.isHidden = false
                cell.topViewConstraintLine.constant = 50
                cell.topViewConstraint.constant = 50
                cell.heightViewConstraint.constant = 196
            }
            cell.labelNumber.text = "#" + String(indexPath.row + 1)
            cell.labelInsuranceType.text =  "Primary Insurance"
            cell.lblPayerName.text = insuranceviewmodel.patientPimaryInsurance[indexPath.row].payerName
            cell.lblGroupNo.text = insuranceviewmodel.patientPimaryInsurance[indexPath.row].groupNo
            cell.lblGroupName.text = insuranceviewmodel.patientPimaryInsurance[indexPath.row].groupName
            cell.lblCopay.text = insuranceviewmodel.patientPimaryInsurance[indexPath.row].copay
            cell.lblcoInformation.text = insuranceviewmodel.patientPimaryInsurance[indexPath.row].coInsurance
            cell.lblRelationship.text = insuranceviewmodel.patientPimaryInsurance[indexPath.row].relationShip
            cell.lblTerminationDate.text = insuranceviewmodel.patientPimaryInsurance[indexPath.row].terminationDate
            cell.lblEffectiveDate.text = insuranceviewmodel.patientPimaryInsurance[indexPath.row].effectiveDate
            cell.lblSubcriberName.text = insuranceviewmodel.patientPimaryInsurance[indexPath.row].subscriberName
            cell.lblPolicyName.text = insuranceviewmodel.patientPimaryInsurance[indexPath.row].policyNo
            cell.delegate = self
            cell.indexPath = indexPath
        return cell
        }
         if indexPath.section == 1{
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! insuranceInformationTableViewCell
            if indexPath.row != 0{
                cell.labelInsuranceType.isHidden = true
                cell.insuranceView.isHidden = true
                cell.topViewConstraintLine.constant = 10
                cell.topViewConstraint.constant = 10
                cell.heightViewConstraint.constant = 115
            }
            else {
                cell.labelInsuranceType.isHidden = false
                cell.insuranceView.isHidden = false
                cell.topViewConstraintLine.constant = 50
                cell.topViewConstraint.constant = 50
                cell.heightViewConstraint.constant = 196
            }
            cell.labelNumber.text = "#" + String(indexPath.row + 1)
            cell.labelInsuranceType.text =  "Secondary Insurance"
            cell.lblPayerName.text = insuranceviewmodel.patientSeondaryInsurance[indexPath.row].payerName
            cell.lblGroupNo.text = insuranceviewmodel.patientSeondaryInsurance[indexPath.row].groupNo
            cell.lblGroupName.text = insuranceviewmodel.patientSeondaryInsurance[indexPath.row].groupName
            cell.lblCopay.text = insuranceviewmodel.patientSeondaryInsurance[indexPath.row].copay
            cell.lblcoInformation.text = insuranceviewmodel.patientSeondaryInsurance[indexPath.row].coInsurance
            cell.lblRelationship.text = insuranceviewmodel.patientSeondaryInsurance[indexPath.row].relationShip
            cell.lblTerminationDate.text = insuranceviewmodel.patientSeondaryInsurance[indexPath.row].terminationDate
            cell.lblEffectiveDate.text = insuranceviewmodel.patientSeondaryInsurance[indexPath.row].effectiveDate
            cell.lblSubcriberName.text = insuranceviewmodel.patientSeondaryInsurance[indexPath.row].subscriberName
            cell.lblPolicyName.text = insuranceviewmodel.patientSeondaryInsurance[indexPath.row].policyNo
            cell.delegate = self
            cell.indexPath = indexPath
            
         return cell
         }
         if indexPath.section == 2{
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! insuranceInformationTableViewCell
            if indexPath.row != 0{
                cell.labelInsuranceType.isHidden = true
                cell.insuranceView.isHidden = true
                cell.topViewConstraintLine.constant = 10
                cell.topViewConstraint.constant = 10
                cell.heightViewConstraint.constant = 115
            }
            else {
                cell.labelInsuranceType.isHidden = false
                cell.insuranceView.isHidden = false
                cell.topViewConstraintLine.constant = 50
                cell.topViewConstraint.constant = 50
                cell.heightViewConstraint.constant = 196
            }
            cell.delegate = self
            cell.indexPath = indexPath
            cell.labelNumber.text = "#" + String(indexPath.row + 1)
            cell.labelInsuranceType.text =  "Terminated Insurance"
            cell.lblPayerName.text = insuranceviewmodel.patientOtherInsurance[indexPath.row].payerName
            cell.lblGroupNo.text = insuranceviewmodel.patientOtherInsurance[indexPath.row].groupNo
            cell.lblGroupName.text = insuranceviewmodel.patientOtherInsurance[indexPath.row].groupName
            cell.lblCopay.text = insuranceviewmodel.patientOtherInsurance[indexPath.row].copay
            cell.lblcoInformation.text = insuranceviewmodel.patientOtherInsurance[indexPath.row].coInsurance
            cell.lblRelationship.text = insuranceviewmodel.patientOtherInsurance[indexPath.row].relationShip
            cell.lblTerminationDate.text = insuranceviewmodel.patientOtherInsurance[indexPath.row].terminationDate
            cell.lblEffectiveDate.text = insuranceviewmodel.patientOtherInsurance[indexPath.row].effectiveDate
            cell.lblSubcriberName.text = insuranceviewmodel.patientOtherInsurance[indexPath.row].subscriberName
            cell.lblPolicyName.text = insuranceviewmodel.patientOtherInsurance[indexPath.row].policyNo
         return cell
         }
         if indexPath.section == 3{
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! insuranceInformationTableViewCell
            if indexPath.row != 0{
                cell.labelInsuranceType.isHidden = true
                cell.insuranceView.isHidden = true
                cell.topViewConstraintLine.constant = 10
                cell.topViewConstraint.constant = 10
                cell.heightViewConstraint.constant = 115
            }
            else {
                cell.labelInsuranceType.isHidden = false
                cell.insuranceView.isHidden = false
                cell.topViewConstraintLine.constant = 50
                cell.topViewConstraint.constant = 50
                cell.heightViewConstraint.constant = 196
            }
            cell.delegate = self
            cell.indexPath = indexPath
            cell.labelNumber.text = "#" + String(indexPath.row + 1)
            cell.labelInsuranceType.text =  "Other Insurance"
            cell.lblPayerName.text = insuranceviewmodel.patientTerminatedInsurance[indexPath.row].payerName
            cell.lblGroupNo.text = insuranceviewmodel.patientTerminatedInsurance[indexPath.row].groupNo
            cell.lblGroupName.text = insuranceviewmodel.patientTerminatedInsurance[indexPath.row].groupName
            cell.lblCopay.text = insuranceviewmodel.patientTerminatedInsurance[indexPath.row].copay
            cell.lblcoInformation.text = insuranceviewmodel.patientTerminatedInsurance[indexPath.row].coInsurance
            cell.lblRelationship.text = insuranceviewmodel.patientTerminatedInsurance[indexPath.row].relationShip
            cell.lblTerminationDate.text = insuranceviewmodel.patientTerminatedInsurance[indexPath.row].terminationDate
            cell.lblEffectiveDate.text = insuranceviewmodel.patientTerminatedInsurance[indexPath.row].effectiveDate
            cell.lblSubcriberName.text = insuranceviewmodel.patientTerminatedInsurance[indexPath.row].subscriberName
            cell.lblPolicyName.text = insuranceviewmodel.patientTerminatedInsurance[indexPath.row].policyNo
         return cell
         }
        return UITableViewCell()
      }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 300
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! insuranceInformationTableViewCell
//        cell.heightViewConstraint.constant = 100
//    }
//}
}
