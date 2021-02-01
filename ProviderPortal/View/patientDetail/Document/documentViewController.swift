//
//  documentViewController.swift
//  ProviderPortal
//
//  Created by Apple on 23/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class documentViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var documentviewmodel = patientDocumentViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Documents"
        tableView.isHidden = true
        self.showSpinner(onView: self.view)
        documentviewmodel.vc = self
        documentviewmodel.getPatientDocuments()
    }
    
    @IBAction func btnFilter(_ sender: Any) {
        guard let popupVC = storyboard?.instantiateViewController(withIdentifier: "DocumentFilterViewController") as? DocumentFilterViewController else { return }
        popupVC.height = 480
        popupVC.topCornerRadius = 25
        popupVC.presentDuration = 1
        popupVC.dismissDuration = 1
        present(popupVC, animated: false, completion: nil)
        
    }
}
extension documentViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if documentviewmodel.documentModelArray.count != 0{
            self.tableView.isHidden = false
            self.removeSpinner()
        }
        return documentviewmodel.documentModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! documentTableViewCell
        cell.dateLabel.text = documentviewmodel.documentModelArray[indexPath.row].documentDate
        cell.documentLabel.text = documentviewmodel.documentModelArray[indexPath.row].documentName
        cell.documentTypeLabe.text = documentviewmodel.documentModelArray[indexPath.row].categoryName
        cell.providerLabel.text = documentviewmodel.documentModelArray[indexPath.row].providerName
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
