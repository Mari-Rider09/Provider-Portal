//
//  DWCViewController.swift
//  ProviderPortal
//
//  Created by Hamza Ishaq on 05/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class DWCViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    
    
    // MARK: - Outlets
    @IBOutlet var topView: UIView!
    @IBOutlet var totalFilesView: UIView!
    @IBOutlet var completedFilesView: UIView!
    @IBOutlet var InProcessView: UIView!
    @IBOutlet var bottomView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        topView.dropShadow2()
        totalFilesView.dropShadow2()
        completedFilesView.dropShadow2()
        InProcessView.dropShadow2()
        bottomView.dropShadow2()
        navigationItem.title = "DWC"
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 10
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DWCTableViewCell
        return cell
      }
}
