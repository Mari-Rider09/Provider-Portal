//
//  insuranceInformationTableViewCell.swift
//  ProviderPortal
//
//  Created by Apple on 16/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
protocol HideShowBtnDelegate: AnyObject {
    func btnHideShowClick(cell:insuranceInformationTableViewCell)
}
class insuranceInformationTableViewCell: UITableViewCell {

    @IBOutlet var labelNumber: UILabel!
    @IBOutlet var labelInsuranceType: UILabel!
    @IBOutlet var insuranceView: UIView!
    @IBOutlet weak var backShadeView: UIView!
    @IBOutlet weak var lblPayerName: UILabel!
    @IBOutlet weak var lblPolicyName: UILabel!
    @IBOutlet weak var lblGroupName: UILabel!
    @IBOutlet weak var lblcoInformation: UILabel!
    @IBOutlet weak var lblTerminationDate: UILabel!
    @IBOutlet weak var lblSubcriberName: UILabel!
    @IBOutlet weak var lblGroupNo: UILabel!
    @IBOutlet weak var lblCopay: UILabel!
    @IBOutlet weak var lblRelationship: UILabel!
    @IBOutlet weak var lblEffectiveDate: UILabel!
    @IBOutlet var bottomView: UIView!
    
    
    @IBOutlet var topViewConstraintLine: NSLayoutConstraint!
    @IBOutlet var topViewConstraint: NSLayoutConstraint!
    @IBOutlet var heightViewConstraint: NSLayoutConstraint!
    
    @IBOutlet var btnHideShow: UIButton!
    var delegate: HideShowBtnDelegate?
    var indexPath:IndexPath!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backShadeView.dropShadow2()
        insuranceView.dropShadow2()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func actionBtn(_ sender: Any) {
        delegate?.btnHideShowClick(cell: self)
    }
    
}
