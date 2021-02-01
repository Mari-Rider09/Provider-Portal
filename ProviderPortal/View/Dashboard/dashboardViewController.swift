//
//  dashboardViewController.swift
//  ProviderPortal
//
//  Created by Apple on 23/09/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import SideMenu
import Highcharts
import BottomPopup
import Alamofire

var dashboardDateString = String()
class dashboardViewController: UIViewController {
    
    var haza: String = "Hamza"
    var dvm = dashBoardViewModel()
    var param = Parameters()
    
    // MARK: - Outlets
    @IBOutlet weak var filterVirew: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lbldashboardDateString: UILabel!
    
    // MARK: - Variables
    var menu: SideMenuNavigationController?
    var ratioData1 = [NSNumber]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dvm.dasvc = self
        getDateAndData()
        filterVirew.dropShadow2()
        let lbNavTitle = UILabel (frame: CGRect(x: 200, y: 40, width: 200, height: 40))
        lbNavTitle.text = "Dashboard"
        lbNavTitle.textColor = #colorLiteral(red: 0.9999127984, green: 1, blue: 0.9998814464, alpha: 1)
        self.navigationItem.titleView = lbNavTitle
        menu = SideMenuNavigationController(rootViewController: MenuListViewController())
        menu?.leftSide = true
       
    }
    func getDateAndData() {
        let today = Date() //Jun 21, 2017, 7:18 PM
        let nintyDaysBeforeToday = Calendar.current.date(byAdding: .day, value: -90, to: today)! //May 22, 2017, 7:18 PMaa
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MM/dd/yyyy"
        
        let now = dateFormatterPrint.string(from: today)
        let lastninty = dateFormatterPrint.string(from: nintyDaysBeforeToday)
        dashboardDateString = "Last 90 Days (Post)"+" "+lastninty+"-"+now
        self.lbldashboardDateString.text = dashboardDateString
        let para: Parameters = [
            "PracticeLocationsId":"",
            "DATEOFSERIVCEFROM":"",
            "DATEOFSERIVCETO":"",
            "PostDateFrom":lastninty,
            "PostDateTo":now
        ]
        self.tableView.isHidden = true
        self.showSpinner(onView: self.view)
        dvm.getDashbordData(para: para)
    }

    
    // MARK: - TableView
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 6
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0{
//            return 260
//        }else if indexPath.section == 1{
//            return 300
//        }else if indexPath.section == 2{
//            return 300
//        }else if indexPath.section == 3{
//            return 300
//        }else if indexPath.section == 4{
//            return 300
//        }else if indexPath.section == 5{
//            return 300
//        }
//        return 0
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0{
//            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! MainDetailTableViewCell
//            cell.labelCharges.text = currencyFormatter(amount: dvm.pyamentDueObject.charges)
//            cell.labelPayments.text = currencyFormatter(amount: dvm.pyamentDueObject.payments)
//            cell.labelPatientPayment.text = currencyFormatter(amount: dvm.pyamentDueObject.patientPaidAmt)
//            cell.labelBalanceDue.text = currencyFormatter(amount: dvm.pyamentDueObject.balanceDue)
//            return cell
//        }
//        else if indexPath.section == 1{
//            let cell = tableView.dequeueReusableCell(withIdentifier: "RatioCell", for: indexPath) as! RatioChartTableViewCell
//
//            cell.ratioChart()
//            return cell
//        }
//        else if indexPath.section == 2{
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CSSCell", for: indexPath) as! ClaimSubmissionTableViewCell
//            cell.pieView()
//            return cell
//        }
//        else if indexPath.section == 3{
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CRCell", for: indexPath) as! ClaimReportTableViewCell
//            cell.barCharts()
//            return cell
//        }
//        else if indexPath.section == 4{
//            let cell = tableView.dequeueReusableCell(withIdentifier: "PCDCell", for: indexPath) as! PyaerClaimTableViewCell
//            cell.pieView()
//            return cell
//        }
//        else if indexPath.section == 5{
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CCCell", for: indexPath) as! ColumnChartTableViewCell
//            cell.barCharts()
//            return cell
//        }
//        return UITableViewCell()
//    }
    
    // MARK: - Button Actions
    @IBAction func didTapMenu(){
        present(menu!, animated: true)
    }
    @IBAction func btnFilter(_ sender: Any) {
       guard let popupVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? dashboardFilterViewController else { return }
               
               popupVC.completion = { para in
                 self.lbldashboardDateString.text = dashboardDateString
                   self.param = para
                   self.tableView.isHidden = true
                   self.showSpinner(onView: self.view)
                   self.dvm.getDashbordData(para: self.param)
               }
               popupVC.height = view.frame.height/1.6
               popupVC.topCornerRadius = 20
               popupVC.presentDuration = 1
               popupVC.dismissDuration = 1
               //        popupVC.shouldDismissInteractivelty = dismissInteractivelySwitch.isOn
               //        popupVC.popupDelegate = self
               present(popupVC, animated: true, completion: nil)
               //        self.performSegue(withIdentifier: "show", sender: self)
    }
    func currencyFormatter(amount: Double) -> String {
        let myDouble = amount
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
        let priceString = currencyFormatter.string(from: NSNumber(value: myDouble))!
        return priceString
    }
}
extension dashboardViewController: UITableViewDelegate,UITableViewDataSource{
    
    // MARK: - TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 260
        }else if indexPath.section == 1{
            return 320
        }else if indexPath.section == 2{
            return 300
        }else if indexPath.section == 3{
            return 300
        }else if indexPath.section == 4{
            return 300
        }else if indexPath.section == 5{
            return 300
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! MainDetailTableViewCell
            cell.labelCharges.text = currencyFormatter(amount: dvm.pyamentDueObject.charges)
            cell.labelPayments.text = currencyFormatter(amount: dvm.pyamentDueObject.payments)
            cell.labelPatientPayment.text = currencyFormatter(amount: dvm.pyamentDueObject.patientPaidAmt)
            cell.labelBalanceDue.text = currencyFormatter(amount: dvm.pyamentDueObject.balanceDue)
            
            return cell
        }
        else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "RatioCell", for: indexPath) as! RatioChartTableViewCell
            
            cell.ratioChart()
            return cell
        }
        else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CSSCell", for: indexPath) as! ClaimSubmissionTableViewCell
            cell.pieView()
            return cell
        }
        else if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CRCell", for: indexPath) as! ClaimReportTableViewCell
            cell.barCharts()
            return cell
        }
        else if indexPath.section == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PCDCell", for: indexPath) as! PyaerClaimTableViewCell
            cell.pieView()
            return cell
        }
        else if indexPath.section == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CCCell", for: indexPath) as! ColumnChartTableViewCell
            cell.barCharts()
            return cell
        }
        return UITableViewCell()
    }
}
