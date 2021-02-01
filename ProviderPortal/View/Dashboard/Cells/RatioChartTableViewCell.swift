//
//  RatioChartTableViewCell.swift
//  ProviderPortal
//
//  Created by Hamza Ishaq on 29/09/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import Highcharts
var paymentchargesratio = [NSNumber]()
var chargesadjustmentratio = [NSNumber]()
var serviceDate = [String]()
class RatioChartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ratioChartView: UIView!
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        ratioChartView.dropShadow2()
    }
    // Initialization code
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func ratioChart() {
        let chartView = HIChartView(frame: CGRect(x: 0, y: 35, width: ratioChartView.frame.width, height: ratioChartView.frame.height - 30))
        chartView.plugins = ["series-label"]
        let exporting = HIExporting()
        exporting.enabled = false
        
        let credits = HICredits()
        credits.enabled = false
        let options = HIOptions()
        
        let title = HITitle()
        title.text = ""
        options.title = title
        
        let yAxis = HIYAxis()
        yAxis.title = HITitle()
        yAxis.title.text = ""
        options.yAxis = [yAxis]
        
        let xaxis = HIXAxis()
        xaxis.categories = serviceDate
        let yaxis = HIYAxis()
        yaxis.title = HITitle()
        yaxis.title.text = " "
        
        
        //        let legend = HILegend()
        //        legend.layout = "vertical"
        //        legend.align = "right"
        //        legend.verticalAlign = "middle"
        //        options.legend = legend
        
        let plotOptions = HIPlotOptions()
        plotOptions.series = HISeries()
        plotOptions.series.label = HILabel()
        plotOptions.series.label.connectorAllowed = false
        options.xAxis = [xaxis]
        options.plotOptions = plotOptions
        options.exporting = exporting
        options.credits = credits
        
        
        let line1 = HISeries()
        line1.name = "Payment Charges Ratio"
        line1.color = HIColor(hexValue: "1FBD13")
        line1.data = paymentchargesratio
        
        let line2 = HISeries()
        line2.name = "Adjustment Charges Ratio"
        line2.data = chargesadjustmentratio
        
        options.series = [line1, line2]
        
        let responsive = HIResponsive()
        let rules = HIRules()
        rules.condition = HICondition()
        //        rules.condition.maxWidth = 0
        rules.chartOptions = [
            "legend": [
                "layout": "horizontal",
                "align": "center",
                "verticalAlign": "bottom"
            ]
        ]
        responsive.rules = [rules]
        options.responsive = responsive
        
        chartView.options = options
        
        ratioChartView.addSubview(chartView)
        
    }
}

