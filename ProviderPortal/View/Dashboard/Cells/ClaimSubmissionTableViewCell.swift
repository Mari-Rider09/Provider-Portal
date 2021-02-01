//
//  ClaimSubmissionTableViewCell.swift
//  ProviderPortal
//
//  Created by Hamza Ishaq on 29/09/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import Highcharts
var claimSubmissionArr =  [Any]()
class ClaimSubmissionTableViewCell: UITableViewCell {
    
    //    var chartView: HIChartView!
    let options = HIOptions()
    var chartView: HIChartView!
    @IBOutlet weak var claimSubmisionStatusView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        claimSubmisionStatusView.dropShadow2()
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    let dvm = dashBoardViewModel()
    
    func pieView() {
        self.chartView = HIChartView(frame: CGRect(x: 0, y: 28, width: claimSubmisionStatusView.frame.width, height: claimSubmisionStatusView.frame.height - 55))
        let chart = HIChart()
        chart.type = "line"
        chart.plotShadow = NSNumber(value: false)
        
        let title = HITitle()
        title.text = " "
        
        let tooltip = HITooltip()
        tooltip.pointFormat = "{series.name}: <b>{point.percentage:.1f}%</b>"
        
        let exporting = HIExporting()
        exporting.enabled = false
        
        let credits = HICredits()
        credits.enabled = false
        
        let plotOptions = HIPlotOptions()
        plotOptions.pie = HIPie()
        plotOptions.pie.allowPointSelect = NSNumber(value: true)
        plotOptions.pie.cursor = "pointer"
        plotOptions.pie.dataLabels = HIDataLabels()
        plotOptions.pie.dataLabels.enabled = NSNumber(value: true)
        plotOptions.pie.dataLabels.format = "<b>{point.name}</b>: {point.percentage:.1f} %"
        
        let pie = HIPie()
        pie.name = "Brands"
        pie.data = claimSubmissionArr
        let options = HIOptions()
        options.chart = chart
        options.title = title
        options.tooltip = tooltip
        options.plotOptions = plotOptions
        options.series = [pie]
        options.credits = credits
        options.exporting = exporting
        
        chartView.options = options
        claimSubmisionStatusView.addSubview(chartView)
    }
}

