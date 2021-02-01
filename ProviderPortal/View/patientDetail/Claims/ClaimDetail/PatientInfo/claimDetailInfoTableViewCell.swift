//
//  claimDetailInfoTableViewCell.swift
//  ProviderPortal
//
//  Created by Hamza Ishaq on 12/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class claimDetailInfoTableViewCell: UITableViewCell {

    // MARK:-LabelOutlets
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var labelInfoName: UILabel!
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
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.dropShadow2()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
