//
//  demographicViewController.swift
//  ProviderPortal
//
//  Created by Apple on 12/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit


class demographicViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var demographicViewModel = patientDemographicViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isHidden = true
        self.showSpinner(onView:  self.view)
        navigationItem.title = " Demographic"
        demographicViewModel.vc = self
        
//        tableView.isHidden = true
        demographicViewModel.getPatientDemogrphic()
        // Do any additional setup after loading the view.
    }
}

// extenion for  tableview
extension demographicViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if demographicViewModel.patientdemographic.firstName != ""{
            self.tableView.isHidden = false
            self.removeSpinner()
        }
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! demographicTableViewCell
            let fullName = demographicViewModel.patientdemographic.firstName + " " + demographicViewModel.patientdemographic.lastName
            cell.fullNameLabel.text = fullName
            cell.dobLabel.text = demographicViewModel.patientdemographic.dateOfBirth
            cell.ssnLabel.text = demographicViewModel.patientdemographic.ssn
            cell.genderLabel.text = demographicViewModel.patientdemographic.gender
            cell.maritalStatusLabel.text = demographicViewModel.patientdemographic.maritalStatus
            cell.raceLabel.text = demographicViewModel.patientdemographic.raceName
            cell.ethnicityLabel.text = demographicViewModel.patientdemographic.ethnicityName
            cell.generalBackView.dropShado1()
            
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! demographicTableViewCell
            cell.addressLabel.text = demographicViewModel.patientdemographic.address
            cell.addressTypeLabel.text = demographicViewModel.patientdemographic.addressType
            cell.cityLabel.text = demographicViewModel.patientdemographic.city
            cell.stateLabel.text = demographicViewModel.patientdemographic.state
            cell.zipCodeLabel.text = demographicViewModel.patientdemographic.zip
            cell.homePhoneLabel.text = demographicViewModel.patientdemographic.homePhone
            cell.workPhoneLabel.text = demographicViewModel.patientdemographic.workPhone
            cell.extLabel.text = demographicViewModel.patientdemographic.ext
            cell.cellPhoneLabel.text = demographicViewModel.patientdemographic.cell
            cell.ccpLabel.text = demographicViewModel.patientdemographic.ccp
            cell.emailLabel.text = demographicViewModel.patientdemographic.email
            
            cell.addressBackView.dropShado1()
            return cell
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! demographicTableViewCell
            
            _ = demographicViewModel.patientdemographic.firstName + " " + demographicViewModel.patientdemographic.lastName
            cell.relationshipLabel.text = demographicViewModel.patientdemographic.guarantorRelationship
//            cell.fulNameLabel.text = "fullName"
            cell.financialBackView.dropShado1()
            return cell
        }else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! demographicTableViewCell
            
            cell.nameLabel.text = demographicViewModel.patientdemographic.firstName
            cell.emrRelationshipLabel.text = demographicViewModel.patientdemographic.guarantorRelationship
            cell.contactLabel.text = demographicViewModel.patientdemographic.contact
            cell.emergencyBackView.dropShado1()
            return cell
        }else if indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell5", for: indexPath) as! demographicTableViewCell
            
            cell.doDisabilityLabel.text = demographicViewModel.patientdemographic.dateDisability
            cell.doDeathLabel.text = demographicViewModel.patientdemographic.dateDeath
            cell.causeDeathLabel.text = demographicViewModel.patientdemographic.causeDeath
            cell.disabilityBackView.dropShado1()
            
            return cell
        }else if indexPath.row == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell6", for: indexPath) as! demographicTableViewCell
            cell.pharmacyNameLabel.text = demographicViewModel.patientdemographic.causeDeath
            cell.pharmacyBackView.dropShado1()
            
            return cell
        }else if indexPath.row == 6{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell7", for: indexPath) as! demographicTableViewCell
            cell.notesBackView.dropShado1()
            
            return cell
        }
        
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 220
        }else if indexPath.row == 1{
            return 295
        }else if indexPath.row == 2{
            return 110
        }else if indexPath.row == 3{
            return 130
        }else if indexPath.row == 4{
            return 130
        }else if indexPath.row == 5{
            return 90
        }else if indexPath.row == 6{
            return 100
        }
        return 300
    }
}
