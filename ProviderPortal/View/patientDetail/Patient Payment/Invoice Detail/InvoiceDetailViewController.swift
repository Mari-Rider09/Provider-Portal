//
//  InvoiceDetailViewController.swift
//  ProviderPortal
//
//  Created by Hamza Ishaq on 03/12/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class InvoiceDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Patient Invoice Detail"
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! InvoiceDetailTableViewCell
        return cell
    }
}
