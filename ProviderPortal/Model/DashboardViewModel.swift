////
////  DashboardViewModel.swift
////  ProviderPortal
////
////  Created by Apple on 22/12/2020.
////  Copyright © 2020 Apple. All rights reserved.
////
//
//import Foundation
//import Alamofire
//class dashBoardViewModel {
//
//    var providersArray = [providers]()
//    var pyamentDueObject = paymentDues()
//    var barChartArray = [barChartData]()
//    var ratioChartArray = [adjustmentRatioChart]()
//    var submissionChartArray = [claimSubmissionChart]()
//    var sAgingReprtChartArray = [submissionAgingReportChart]()
//    var cDistributionChartArray = [claimDistributionChart]()
//    var location = Location()
//    var pLocationArray = [practiceLocations]()
//    var locatioddlArray = [locationDDL]()
//
//    var dasvc: dashboardViewController?
//    var voc: RatioChartTableViewCell?
//    //    var aaaa: ClaimSubmissionTableViewCell?
//    var dashFilterVc: dashboardFilterViewController?
//
//    func getDashbordData(para: Parameters){
//        let url = "http://providerapi.maxremind.biz/api/Dashboard"
//        if ConnectionCheck.isConnectedToNetwork(){
//            AF.request(url,method: .post ,parameters: para,encoding: JSONEncoding.default, headers: headers).responseJSON{ response in
//                switch response.result{
//                case .success(_):
//                    if response.response?.statusCode == 200{
//                        if response.value != nil{
//                            guard let resp = response.value as? Dictionary<String,Any> else {return}
//                            //Mark:- map the providers array in model classes
//                            guard let provider = resp["providers"] as? [Dictionary<String,Any>] else {return}
//                            provider.forEach { (data) in
//                                let psId = data["practiceStaffId"] as? Int ?? 0
//                                let pid = data["practiceId"] as? Int ?? 0
//                                let name = data["name"] as? String ?? ""
//
//                                let list = providers(psId: psId, pid: pid, name: name)
//                                self.providersArray.append(list)
//                                providerName.append(name)
//                                providerNameId.append(psId)
//                            }
//
//                            //Mark:- map the paymentDue object in Model Classes
//                            if let paymendue = resp["paymentDues"] as? Dictionary<String,Any>{
//                                self.pyamentDueObject.charges = paymendue["charges"] as? Double ?? 0.0
//                                self.pyamentDueObject.payments = paymendue["payments"] as? Double ?? 0.0
//                                self.pyamentDueObject.adjustments = paymendue["adjustments"] as? Double ?? 0.0
//                                self.pyamentDueObject.balanceDue = paymendue["balanceDue"] as? Double ?? 0.0
//                                self.pyamentDueObject.patientPaidAmt = paymendue["patientPaidAmt"] as? Double ?? 0.0
//                            }
//
//                            //Mark:- map the barChart array in model classes
//                            guard let barchart = resp["barChart_Data"] as? [Dictionary<String,Any>] else{return}
//                            barchart.forEach { (data) in
//                                let tcharges = data["totalCharges"] as? Double ?? 0.0
//                                let pamount = data["paidAmount"] as? Double ?? 0.0
//                                let adjamount = data["adjustedAmount"] as? Double ?? 0.0
//                                let servdate = data["serviceDate"] as? String ?? ""
//
//                                let list = barChartData(tCharges: tcharges, pAmount: pamount, adjAmount: adjamount, servDate: servdate)
//                                self.barChartArray.append(list)
//
//                                barChartTotalCharges.append(tcharges)
//                                barChartPaidAmount.append(pamount)
//                                barChartAdjutedAmount.append(adjamount)
//
//                                let date = servdate.split(separator: "T")
//                                let mydate = String(date[0])
//
//                                let dateFormatterGet = DateFormatter()
//                                dateFormatterGet.dateFormat = "yyyy-MM-dd"
//
//                                let dateFormatterPrint = DateFormatter()
//                                dateFormatterPrint.dateFormat = "MM/dd/yyyy"
//
//                                if let date = dateFormatterGet.date(from:mydate) {
//                                    let properDate = dateFormatterPrint.string(from: date)
//                                    barChartServiceDate.append(properDate)
//                                } else {
//                                    print("There was an error decoding the string")
//                                }// end of date
//                            }
//
//                            //Mark:- map the adjustmentRatioChart array in model classes
//                            guard let ratioChart = resp["adjustmentRatioChart_Data"] as? [Dictionary<String,Any>] else{return}
//                            ratioChart.forEach { (data) in
//                                let pcratatio = data["paymentchargesratio"] as? NSNumber ?? 0
//                                let caratio = data["chargesadjustmentratio"] as? NSNumber ?? 0
//                                let servdate = data["serviceDate"] as? String ?? ""
//                                paymentchargesratio.append(pcratatio)
//                                chargesadjustmentratio.append(caratio)
//                                let list = adjustmentRatioChart(pcratio: pcratatio, cjratio: caratio, serviceDate: servdate)
//                                self.ratioChartArray.append(list)
//                                // split date from API date
//                                let date = servdate.split(separator: "T")
//                                let mydate = String(date[0])
//
//                                let dateFormatterGet = DateFormatter()
//                                dateFormatterGet.dateFormat = "yyyy-MM-dd"
//
//                                let dateFormatterPrint = DateFormatter()
//                                dateFormatterPrint.dateFormat = "MM/dd/yyyy"
//
//                                if let date = dateFormatterGet.date(from:mydate) {
//                                    let properDate = dateFormatterPrint.string(from: date)
//                                    serviceDate.append(properDate)
//                                } else {
//                                    print("There was an error decoding the string")
//                                }// end of date
//
//                            }
//
//                            //Mark:- map the claimSubmissionChart array to model classes
//                            guard let cSubmissionChart = resp["claimSubmissionChart_Data"] as? [Dictionary<String,Any>] else{return}
//                            cSubmissionChart.forEach { (data) in
//                                let noclaims = data["numberofclaims"] as? NSNumber ?? 0
//                                let sstatus = data["submissionStatus"] as? String ?? ""
//                                let list = claimSubmissionChart(noclaims: noclaims, subStatus: sstatus)
//                                self.submissionChartArray.append(list)
//                                var map = [String : Any]()
//                                map["name"] = sstatus
//                                map["y"] = noclaims
//
//                                claimSubmissionArr.append(map)
//                            }
//
//                            //Mark:- map the submissionAgingReportChart_Data array to model classe
//                            guard let sAgingReportCharts = resp["submissionAgingReportChart_Data"] as? [Dictionary<String,Any>] else {return}
//                            sAgingReportCharts.forEach { (data) in
//                                let ss = data["submissionStatus"] as? String ?? ""
//                                let zs = data["zeroseven"] as? Int ?? 0
//                                let ef = data["eightfifteen"] as? Int ?? 0
//                                let stone = data["sixteentwentyone"] as? Int ?? 0
//                                let abovetone = data["abovetwentyone"] as? Int ?? 0
//
//                                zeroTseven.append(zs)
//                                eightTfifteen.append(ef)
//                                sixteenTtone.append(stone)
//                                aboveTwentyone.append(abovetone)
//                                subStatus.append(ss)
//                                let list = submissionAgingReportChart(subStatus: ss, zs: zs, ef: ef, stwentyone: stone, abovetwentyone: abovetone)
//                                self.sAgingReprtChartArray.append(list)
//
//
//                            }
//                            //Mark:- map the claimDistributionChart_Data to model classes
//                            guard let cDistributionChart = resp["claimDistributionChart_Data"] as? [Dictionary<String, Any>] else{return}
//                            cDistributionChart.forEach { (data) in
//                                let nocliam = data["numberofclaims"] as? Int ?? 0
//                                let name = data["name"] as? String ?? ""
//
//                                let list = claimDistributionChart(noclaim: nocliam, name: name)
//                                self.cDistributionChartArray.append(list)
//                                var map = [String : Any]()
//                                map["name"] = name
//                                map["y"] = nocliam
//                                PCDistributionArr.append(map)
//                            }
//
//                            //Mark:- map the locations object to model classes
//                            guard let loc = resp["locations"] as? Dictionary<String,Any> else{return}
//                            guard let pLocations = loc["practiceLocations"] as? [Dictionary<String,Any>] else{return}
//                            pLocations.forEach { (data) in
//                                let plId = data["practiceLocationsId"] as? Int ?? 0
//                                let name = data["name"] as? String ?? ""
//                                let city = data["city"] as? String ?? ""
//                                let stateCode = data["stateCode"] as? String ?? ""
//                                let zip = data["zip"] as? String ?? ""
//                                let address = data["address"] as? String ?? ""
//                                let taxId = data["taxId"] as? Int ?? 0
//                                let npi = data["npi"] as? Int ?? 0
//
//                                let list = practiceLocations(plId: plId, name: name, city: city, stateCode: stateCode, zip: zip, address: address, taxId: taxId, npi: npi)
//                                self.location.practicelocations.append(list)
//
//
//                            }//end of practice location
//
//                            //Mark:- map the locationDDL to model classes
//                            guard let locddl = loc["locationDDL"] as? [Dictionary<String,Any>] else{return}
//                            locddl.forEach { (data) in
//                                let ddlid = data["ddlId"] as? Int ?? 0
//                                let name = data["name"] as? String ?? ""
//
//                                let list = locationDDL(ddlId: ddlid, name: name)
//                                self.location.locationddl.append(list)
//                                ddlName.append(name)
//                                ddlID.append(ddlid)
//                            }
//                            DispatchQueue.main.async {
//                                self.dasvc?.removeSpinner()
//                                self.dasvc?.tableView.isHidden = false
//                                self.dasvc?.tableView.reloadData()
//                            }
//                        }
//                    }
//
//                case .failure(_):
//                    self.dasvc?.removeSpinner()
//                    self.dasvc?.tableView.isHidden = false
////                    print("what the fuck")
//                }
//            }
//        }else{
//            print("network error")
//        }
//    }
//}
import Foundation
import Alamofire
class dashBoardViewModel {
    
    var providersArray = [providers]()
    var pyamentDueObject = paymentDues()
    var barChartArray = [barChartData]()
    var ratioChartArray = [adjustmentRatioChart]()
    var submissionChartArray = [claimSubmissionChart]()
    var sAgingReprtChartArray = [submissionAgingReportChart]()
    var cDistributionChartArray = [claimDistributionChart]()
    var location = Location()
    var pLocationArray = [practiceLocations]()
    var locatioddlArray = [locationDDL]()
    
    
    var dasvc: dashboardViewController?
    var voc: RatioChartTableViewCell?
    //    var aaaa: ClaimSubmissionTableViewCell?
    var dashFilterVc: dashboardFilterViewController?
    
    func getDashbordData(para: Parameters){
        let url = "http://providerapi.maxremind.biz/api/Dashboard"
        
        if ConnectionCheck.isConnectedToNetwork(){
            AF.request(url,method: .post ,parameters: para,encoding: JSONEncoding.default, headers: headers).responseJSON{ response in
                barChartTotalCharges.removeAll()
                barChartPaidAmount.removeAll()
                barChartAdjutedAmount.removeAll()
                barChartServiceDate.removeAll()
                ddlName.removeAll()
                ddlID.removeAll()
                providerName.removeAll()
                providerNameId.removeAll()
                paymentchargesratio.removeAll()
                chargesadjustmentratio.removeAll()
                serviceDate.removeAll()
                claimSubmissionArr.removeAll()
                zeroTseven.removeAll()
                eightTfifteen.removeAll()
                sixteenTtone.removeAll()
                aboveTwentyone.removeAll()
                subStatus.removeAll()
                PCDistributionArr.removeAll()
                
                switch response.result{
                case .success(_):
                    if response.response?.statusCode == 200{
                        if response.value != nil{
                            guard let resp = response.value as? Dictionary<String,Any> else {return}
                            //Mark:- map the providers array in model classes
                            ddlName.append("All")
                            providerName.append("All")
                            guard let provider = resp["providers"] as? [Dictionary<String,Any>] else {return}
                            provider.forEach { (data) in
                                let psId = data["practiceStaffId"] as? Int ?? 0
                                let pid = data["practiceId"] as? Int ?? 0
                                let name = data["name"] as? String ?? ""
                                
                                let list = providers(psId: psId, pid: pid, name: name)
                                self.providersArray.append(list)
                                providerName.append(name)
                                providerNameId.append(psId)
                            }
                            
                            //Mark:- map the paymentDue object in Model Classes
                            if let paymendue = resp["paymentDues"] as? Dictionary<String,Any>{
                                self.pyamentDueObject.charges = paymendue["charges"] as? Double ?? 0.0
                                self.pyamentDueObject.payments = paymendue["payments"] as? Double ?? 0.0
                                self.pyamentDueObject.adjustments = paymendue["adjustments"] as? Double ?? 0.0
                                self.pyamentDueObject.balanceDue = paymendue["balanceDue"] as? Double ?? 0.0
                                self.pyamentDueObject.patientPaidAmt = paymendue["patientPaidAmt"] as? Double ?? 0.0
                            }
                            
                            //Mark:- map the barChart array in model classes
                            guard let barchart = resp["barChart_Data"] as? [Dictionary<String,Any>] else{return}
                            barchart.forEach { (data) in
                                let tcharges = data["totalCharges"] as? Double ?? 0.0
                                let pamount = data["paidAmount"] as? Double ?? 0.0
                                let adjamount = data["adjustedAmount"] as? Double ?? 0.0
                                let servdate = data["serviceDate"] as? String ?? ""
                                
                                let list = barChartData(tCharges: tcharges, pAmount: pamount, adjAmount: adjamount, servDate: servdate)
                                self.barChartArray.append(list)
                                
                                barChartTotalCharges.append(tcharges)
                                barChartPaidAmount.append(pamount)
                                barChartAdjutedAmount.append(adjamount)
                                
                                let date = servdate.split(separator: "T")
                                let mydate = String(date[0])
                                
                                let dateFormatterGet = DateFormatter()
                                dateFormatterGet.dateFormat = "yyyy-MM-dd"
                                
                                let dateFormatterPrint = DateFormatter()
                                dateFormatterPrint.dateFormat = "MM/dd"
                                
                                if let date = dateFormatterGet.date(from:mydate) {
                                    let properDate = dateFormatterPrint.string(from: date)
                                    barChartServiceDate.append(properDate)
                                } else {
                                    print("There was an error decoding the string")
                                }// end of date
                            }
                            
                            //Mark:- map the adjustmentRatioChart array in model classes
                            guard let ratioChart = resp["adjustmentRatioChart_Data"] as? [Dictionary<String,Any>] else{return}
                            ratioChart.forEach { (data) in
                                let pcratatio = data["paymentchargesratio"] as? NSNumber ?? 0
                                let caratio = data["chargesadjustmentratio"] as? NSNumber ?? 0
                                let servdate = data["serviceDate"] as? String ?? ""
                                paymentchargesratio.append(pcratatio)
                                chargesadjustmentratio.append(caratio)
                                let list = adjustmentRatioChart(pcratio: pcratatio, cjratio: caratio, serviceDate: servdate)
                                self.ratioChartArray.append(list)
                                // split date from API date
                                let date = servdate.split(separator: "T")
                                let mydate = String(date[0])
                                
                                let dateFormatterGet = DateFormatter()
                                dateFormatterGet.dateFormat = "yyyy-MM-dd"
                                
                                let dateFormatterPrint = DateFormatter()
                                dateFormatterPrint.dateFormat = "MM/dd"
                                
                                if let date = dateFormatterGet.date(from:mydate) {
                                    let properDate = dateFormatterPrint.string(from: date)
                                    serviceDate.append(properDate)
                                } else {
                                    print("There was an error decoding the string")
                                }// end of date
                                
                            }
                            
                            //Mark:- map the claimSubmissionChart array to model classes
                            guard let cSubmissionChart = resp["claimSubmissionChart_Data"] as? [Dictionary<String,Any>] else{return}
                            cSubmissionChart.forEach { (data) in
                                let noclaims = data["numberofclaims"] as? NSNumber ?? 0
                                let sstatus = data["submissionStatus"] as? String ?? ""
                                let list = claimSubmissionChart(noclaims: noclaims, subStatus: sstatus)
                                self.submissionChartArray.append(list)
                                var map = [String : Any]()
                                map["name"] = sstatus
                                map["y"] = noclaims
                                
                                claimSubmissionArr.append(map)
                            }
                            
                            //Mark:- map the submissionAgingReportChart_Data array to model classe
                            guard let sAgingReportCharts = resp["submissionAgingReportChart_Data"] as? [Dictionary<String,Any>] else {return}
                            sAgingReportCharts.forEach { (data) in
                                let ss = data["submissionStatus"] as? String ?? ""
                                let zs = data["zeroseven"] as? Int ?? 0
                                let ef = data["eightfifteen"] as? Int ?? 0
                                let stone = data["sixteentwentyone"] as? Int ?? 0
                                let abovetone = data["abovetwentyone"] as? Int ?? 0
                                
                                zeroTseven.append(zs)
                                eightTfifteen.append(ef)
                                sixteenTtone.append(stone)
                                aboveTwentyone.append(abovetone)
                                subStatus.append(ss)
                                let list = submissionAgingReportChart(subStatus: ss, zs: zs, ef: ef, stwentyone: stone, abovetwentyone: abovetone)
                                self.sAgingReprtChartArray.append(list)
                                
                                
                            }
                            //Mark:- map the claimDistributionChart_Data to model classes
                            guard let cDistributionChart = resp["claimDistributionChart_Data"] as? [Dictionary<String, Any>] else{return}
                            cDistributionChart.forEach { (data) in
                                let nocliam = data["numberofclaims"] as? Int ?? 0
                                let name = data["name"] as? String ?? ""
                                
                                let list = claimDistributionChart(noclaim: nocliam, name: name)
                                self.cDistributionChartArray.append(list)
                                var map = [String : Any]()
                                map["name"] = name
                                map["y"] = nocliam
                                PCDistributionArr.append(map)
                            }
                            
                            //Mark:- map the locations object to model classes
                            guard let loc = resp["locations"] as? Dictionary<String,Any> else{return}
                            guard let pLocations = loc["practiceLocations"] as? [Dictionary<String,Any>] else{return}
                            pLocations.forEach { (data) in
                                let plId = data["practiceLocationsId"] as? Int ?? 0
                                let name = data["name"] as? String ?? ""
                                let city = data["city"] as? String ?? ""
                                let stateCode = data["stateCode"] as? String ?? ""
                                let zip = data["zip"] as? String ?? ""
                                let address = data["address"] as? String ?? ""
                                let taxId = data["taxId"] as? Int ?? 0
                                let npi = data["npi"] as? Int ?? 0
                                
                                let list = practiceLocations(plId: plId, name: name, city: city, stateCode: stateCode, zip: zip, address: address, taxId: taxId, npi: npi)
                                self.location.practicelocations.append(list)
                                
                                //                                    self.pLocationArray.append(list)
                            }//end of practice location
                            
                            //Mark:- map the locationDDL to model classes
                            guard let locddl = loc["locationDDL"] as? [Dictionary<String,Any>] else{return}
                            locddl.forEach { (data) in
                                let ddlid = data["ddlId"] as? Int ?? 0
                                let name = data["name"] as? String ?? ""
                                
                                let list = locationDDL(ddlId: ddlid, name: name)
                                self.location.locationddl.append(list)
                                ddlName.append(name)
                                ddlID.append(ddlid)
                            }
                            DispatchQueue.main.async {
                                self.dasvc?.tableView.isHidden = false
                                self.dasvc?.removeSpinner()
                                self.dasvc?.tableView.reloadData()
                            }
                        }
                    }
                case .failure(_):
                    self.dasvc?.tableView.isHidden = false
                    self.dasvc?.removeSpinner()
                    self.dasvc?.showAlert("Error!", message: "sorry some thing went wrong")
                }
            }
        }else{
            self.dasvc?.showAlert("error", message: "network issue")
        }
    }
}
