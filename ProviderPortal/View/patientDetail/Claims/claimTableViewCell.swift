//
//  claimTableViewCell.swift
//  ProviderPortal
//
//  Created by Apple on 16/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

protocol OptionButtonsDelegate: AnyObject{
    func btnHideShowClick(cell: claimTableViewCell)
}

class claimTableViewCell: UITableViewCell {
    @IBOutlet weak var heightView: NSLayoutConstraint!
    
    @IBOutlet weak var hideShowView: UIView!
    @IBOutlet weak var btnhideShow: UIButton!
    @IBOutlet weak var claimIdLabel: UILabel!
    @IBOutlet weak var dosLabel: UILabel!
    @IBOutlet weak var insuranceLabel: UILabel!
    @IBOutlet weak var totalChargesLabel: UILabel!
    @IBOutlet weak var amountPaidLabel: UILabel!
    @IBOutlet weak var adjustedLabel: UILabel!
    @IBOutlet weak var balanceDueLabel: UILabel!
    @IBOutlet weak var submissionStatusLabel: UILabel!
    @IBOutlet weak var ptlReasonLabel: UILabel!
    @IBOutlet var btnClaimView: UIButton!
    
    var delegate:OptionButtonsDelegate?
    var indexPath:IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnHideShowAction(_ sender: UIButton) {
        delegate?.btnHideShowClick(cell: self)
    }
}
