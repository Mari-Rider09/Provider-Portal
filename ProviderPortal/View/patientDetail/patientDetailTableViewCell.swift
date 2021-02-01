//
//  patientDetailTableViewCell.swift
//  ProviderPortal
//
//  Created by Apple on 29/09/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class patientDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var patientDetailImage: UIImageView!
    @IBOutlet weak var patientDetailLabel: UILabel!
    @IBOutlet weak var rightArrowImage: UIImageView!
    @IBOutlet weak var patientDetailCellBackView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.patientDetailCellBackView.dropShadow5()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
