//
//  demographicTableViewCell.swift
//  ProviderPortal
//
//  Created by Apple on 21/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class demographicTableViewCell: UITableViewCell {

    @IBOutlet weak var generalBackView: UIView!
    @IBOutlet weak var addressBackView: UIView!
    @IBOutlet weak var financialBackView: UIView!
    @IBOutlet weak var emergencyBackView: UIView!
    @IBOutlet weak var disabilityBackView: UIView!
    @IBOutlet weak var pharmacyBackView: UIView!
    @IBOutlet weak var notesBackView: UIView!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var ssnLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var maritalStatusLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var ethnicityLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressTypeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var homePhoneLabel: UILabel!
    @IBOutlet weak var workPhoneLabel: UILabel!
    @IBOutlet weak var extLabel: UILabel!
    @IBOutlet weak var cellPhoneLabel: UILabel!
    @IBOutlet weak var ccpLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var relationshipLabel: UILabel!
    @IBOutlet weak var fulNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emrRelationshipLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var doDisabilityLabel: UILabel!
    @IBOutlet weak var doDeathLabel: UILabel!
    @IBOutlet weak var causeDeathLabel: UILabel!
    @IBOutlet weak var pharmacyNameLabel: UILabel!
    @IBOutlet weak var notesTextView: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        generalBackView.dr()
//        addressBackView.dropShadow5()
//        financialBackView.dropShadow5()
//        emergencyBackView.dropShadow5()
//        disabilityBackView.dropShadow5()
//        pharmacyBackView.dropShadow5()
//        notesBackView.dropShadow5()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
