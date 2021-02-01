//
//  PatientPaymentViewController.swift
//  ProviderPortal
//
//  Created by Hamza Ishaq on 02/12/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class PatientPaymentViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Patient Payments"

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PatienPaymentTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let storyboard = UIStoryboard(name: "Patient", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "InvoiceDetailViewController")
                    as! InvoiceDetailViewController
                self.navigationController?.pushViewController(vc, animated: true)
    }


}
