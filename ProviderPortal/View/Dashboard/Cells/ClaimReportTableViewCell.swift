//
//  ClaimReportTableViewCell.swift
//  ProviderPortal
//
//  Created by Hamza Ishaq on 29/09/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import Highcharts

var zeroTseven = [Int]()
var eightTfifteen = [Int]()
var sixteenTtone = [Int]()
var aboveTwentyone = [Int]()
var subStatus = [String]()
class ClaimReportTableViewCell: UITableViewCell {
    
    @IBOutlet weak var graphView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        graphView.dropShadow2()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func barCharts() {
        let chartView = HIChartView(frame: CGRect(x: 0, y: 30, width: contentView.frame.width - 20, height: graphView.frame.height - 30))
        
        let options = HIOptions()
        
        let chart = HIChart()
        chart.type = "column"
        
        let title = HITitle()
        title.text = " "
        
        let xaxis = HIXAxis()
        xaxis.categories = subStatus
        
        let yaxis = HIYAxis()
        yaxis.min = NSNumber(value: 0)
        yaxis.title = HITitle()
        yaxis.title.text = " "
        
        let tooltip = HITooltip()
        tooltip.pointFormat = "<span style=\"color:{series.color}\">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>"
        tooltip.shared = NSNumber(value: true)
        
        let plotoptions = HIPlotOptions()
        plotoptions.column = HIColumn()
        plotoptions.column.stacking = "percent"
        
        let column1 = HIColumn()
        column1.name = "0 to 7"
        column1.data = zeroTseven
        
        let column2 = HIColumn()
        column2.name = "8 to 15"
        column2.data = eightTfifteen
        
        let column3 = HIColumn()
        column3.name = "16 to 21"
        column3.data = sixteenTtone
        
        let column4 = HIColumn()
        column4.name = "21+"
        column4.data = aboveTwentyone
        
        let exporting = HIExporting()
        exporting.enabled = false
        
        let credits = HICredits()
        credits.enabled = false
        
        options.chart = chart
        options.title = title
        options.xAxis = [xaxis]
        options.yAxis = [yaxis]
        options.tooltip = tooltip
        options.plotOptions = plotoptions
        options.series = [column1, column2, column3,column4]
        options.credits = credits
        options.exporting = exporting
        
        chartView.options = options
        graphView.addSubview(chartView)
    }
}
