//
//  patientTableViewCell.swift
//  ProviderPortal
//
//  Created by Apple on 25/09/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class patientTableViewCell: UITableViewCell {

    @IBOutlet weak var lblACNumber: UILabel!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblPriInsurance: UILabel!
    @IBOutlet weak var lblserialNumber: UILabel!
    @IBOutlet var lblGender: UILabel!
    @IBOutlet var labelDob: UILabel!
    @IBOutlet var labelPhone: UILabel!
    @IBOutlet var lblAddres: UILabel!
    @IBOutlet var btnViewDetail: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    @IBAction func viewDetail(_ sender: Any) {
       
    }
}
 
