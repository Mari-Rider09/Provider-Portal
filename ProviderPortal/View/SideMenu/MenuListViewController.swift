//
//  MenuListViewController.swift
//  ProviderPortal
//
//  Created by Hamza Ishaq on 29/09/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class MenuListViewController: UITableViewController{
    var items = ["Dashboard","Home","DWC","Patient","Claims","My Invoices","View Profile","Setting","Logout"]

    var image = ["dashboard","home","dwc","patient","claim","my invoice","profile","setting","logout"]

    override func viewDidLoad() {

        
        tableView.separatorColor = #colorLiteral(red: 0.1254401803, green: 0.223551929, blue: 0.4352366328, alpha: 1)
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = #colorLiteral(red: 0.1254401803, green: 0.223551929, blue: 0.4352366328, alpha: 1)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        tableView.tableFooterView = UIView()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
        return 1
        }else{
            return items.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            //set setting for image
            let imageView = UIImageView(frame: CGRect(x: 67, y: 20, width: 105, height: 105))
            let image = UIImage(named: "umair")
            imageView.layer.cornerRadius = (imageView.frame.height)/2
            imageView.layer.masksToBounds = true
            imageView.image = image
            
            //set setting for label
            let userName = UILabel(frame: CGRect(x: 60, y: 130, width: 120, height: 20))
            userName.text = "Umair, Azeem"
            userName.font = UIFont.boldSystemFont(ofSize: 17)
            userName.textAlignment = .center
            userName.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            cell.selectionStyle = .none
            self.view.addSubview(imageView)
            self.view.addSubview(userName)
            cell.backgroundColor = #colorLiteral(red: 0.1254401803, green: 0.223551929, blue: 0.4352366328, alpha: 1)
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            cell.textLabel?.text = items[indexPath.row]
            cell.imageView?.image = UIImage(named: image[indexPath.row])
            cell.backgroundColor = #colorLiteral(red: 0.1254401803, green: 0.223551929, blue: 0.4352366328, alpha: 1)
            cell.selectionStyle = .none
            cell.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.backgroundView?.backgroundColor = .red
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 150
        }else{
            return 40
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            
        }else{
            if items[indexPath.row] == "Patient"{

                let storyboard = UIStoryboard(name: "Patient", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "patientViewController") as! patientViewController

                self.navigationController?.pushViewController(vc, animated: false)
               
            }else if items[indexPath.row] == "Dashboard" {
                self.dismiss(animated: true, completion: nil)
            }
            else if items[indexPath.row] == "DWC"
            {
                let storyboard = UIStoryboard(name: "DWC", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "DWCViewController") as! DWCViewController
                self.navigationController?.pushViewController(vc, animated: false)

            }else if items[indexPath.row] == "Logout"{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "loginViewController") as! loginViewController
                vc.modalPresentationStyle = .fullScreen
//                self.navigationController?.pushViewController(vc, animated: false)
                self.present(vc, animated: true, completion: nil)
                
            }
        }
    }
}
