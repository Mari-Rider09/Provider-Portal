//
//  DocumentFilterViewController.swift
//  ProviderPortal
//
//  Created by Hamza Ishaq on 01/12/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import BottomPopup
import iOSDropDown

class DocumentFilterViewController: BottomPopupViewController {

    @IBOutlet var txtDate: UITextField!
    @IBOutlet var txtDocument: UITextField!
    @IBOutlet var txtDocumentType: UITextField!
    @IBOutlet var txtProvider: DropDown!
    
    var height: CGFloat?
    var topCornerRadius: CGFloat?
    var presentDuration: Double?
    var dismissDuration: Double?
    var shouldDismissInteractivelty: Bool?
    
    typealias completionHandler = ([String: Any]) ->Void
    var completion: completionHandler?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtProvider.inputView = UIView()
        txtProvider.optionArray = ["1","2","3","4"]
        // Do any additional setup after loading the view.
    }
    

  override var popupHeight: CGFloat { return height ?? CGFloat(300) }
  
  override var popupTopCornerRadius: CGFloat { return topCornerRadius ?? CGFloat(10) }
  
  override var popupPresentDuration: Double { return presentDuration ?? 1.0 }
  
  override var popupDismissDuration: Double { return dismissDuration ?? 1.0 }
  
  override var popupShouldDismissInteractivelty: Bool { return shouldDismissInteractivelty ?? true }
    
    @IBAction func Apply(_ sender: Any) {
        
    }
    
}
