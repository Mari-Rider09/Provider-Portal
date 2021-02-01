//
//  MainDetailTableViewCell.swift
//  ProviderPortal
//
//  Created by Hamza Ishaq on 29/09/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class MainDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var parentCellView: UIView!
    @IBOutlet var chargesView: UIView!
    @IBOutlet var paymentView: UIView!
    @IBOutlet var patientPaymentView: UIView!
    @IBOutlet var balanceView: UIView!
    
    @IBOutlet var labelCharges: UILabel!
    @IBOutlet var labelPayments: UILabel!
    @IBOutlet var labelPatientPayment: UILabel!
    @IBOutlet var labelBalanceDue: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentCellView.dropShadow()
        chargesView.dropShadow2()
        paymentView.dropShadow2()
        patientPaymentView.dropShadow2()
        balanceView.dropShadow2()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
