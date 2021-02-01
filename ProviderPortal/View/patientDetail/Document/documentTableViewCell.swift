//
//  documentTableViewCell.swift
//  ProviderPortal
//
//  Created by Apple on 23/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class documentTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var documentLabel: UILabel!
    @IBOutlet weak var documentTypeLabe: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
