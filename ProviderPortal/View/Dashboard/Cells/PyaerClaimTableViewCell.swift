//
//  PyaerClaimTableViewCell.swift
//  ProviderPortal
//
//  Created by Hamza Ishaq on 29/09/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import Highcharts
var PCDistributionArr = [Any]()
class PyaerClaimTableViewCell: UITableViewCell {
    
    @IBOutlet weak var payerClaimDistributionView: UIView!
    
    var chartView: HIChartView!
       let options = HIOptions()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        payerClaimDistributionView.dropShadow2()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func pieView() {
        self.chartView = HIChartView(frame: CGRect(x: 0, y: 28, width: payerClaimDistributionView.frame.width, height: payerClaimDistributionView.frame.height - 55))
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
        pie.data = PCDistributionArr
        
        let options = HIOptions()
        options.chart = chart
        options.title = title
        options.tooltip = tooltip
        options.plotOptions = plotOptions
        options.series = [pie]
        options.credits = credits
        options.exporting = exporting
        
        chartView.options = options
        payerClaimDistributionView.addSubview(chartView)
    }
}
