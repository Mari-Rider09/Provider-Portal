//
//  SummaryDetailTableViewCell.swift
//  ProviderPortal
//
//  Created by Hamza Ishaq on 17/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class SummaryDetailTableViewCell: UITableViewCell {
    
    // MARK:- ViewOutlets
    @IBOutlet var labelHeading: UILabel!
    @IBOutlet var viewLabel: UIView!
    @IBOutlet var viewMain: UIView!
    
    
    // MARK:- LabelOutlets
    @IBOutlet var labelDOS: UILabel!
    @IBOutlet var labelInfoNumber: UILabel!
    @IBOutlet var labelOneH: UILabel!
    @IBOutlet var labelOneD: UILabel!
    @IBOutlet var labelTwoH: UILabel!
    @IBOutlet var labelTwoD: UILabel!
    @IBOutlet var labelThreeH: UILabel!
    @IBOutlet var labelThreeD: UILabel!
    @IBOutlet var labelFourH: UILabel!
    @IBOutlet var labelFourD: UILabel!
    @IBOutlet var labelFifthH: UILabel!
    @IBOutlet var labelFifthD: UILabel!
    @IBOutlet var labelSixH: UILabel!
    @IBOutlet var labelSixD: UILabel!
    @IBOutlet var labelSevenH: UILabel!
    @IBOutlet var labelSevenD: UILabel!
    @IBOutlet var labelEightH: UILabel!
    @IBOutlet var labelEightD: UILabel!
    @IBOutlet var labelNineH: UILabel!
    @IBOutlet var labelNineD: UILabel!
    @IBOutlet var labelTenH: UILabel!
    @IBOutlet var labelTenD: UILabel!
    
    // MARK:- constraintsOutlets
    
    @IBOutlet var viewLabelBottom: NSLayoutConstraint!
    @IBOutlet var viewMainTop: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewLabel.dropShadow2()
        viewMain.dropShadow2()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
