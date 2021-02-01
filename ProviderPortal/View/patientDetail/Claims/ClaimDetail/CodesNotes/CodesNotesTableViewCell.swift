//
//  CodesNotesTableViewCell.swift
//  ProviderPortal
//
//  Created by Hamza Ishaq on 16/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class CodesNotesTableViewCell: UITableViewCell {

    @IBOutlet var labelDX: UILabel!
    @IBOutlet var mainView: UIView!
    @IBOutlet var mainViewDX: UIView!
    
    @IBOutlet var labelNumber: UILabel!
    @IBOutlet var labelCode: UILabel!
    @IBOutlet var labelDiagnosis: UILabel!
    
    
    @IBOutlet var labelTest: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        labelDiagnosis.sizeToFit()
        mainViewDX.dropShadow2()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
